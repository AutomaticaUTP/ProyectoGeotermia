import streamlit as st
import torch
import torch.nn.functional as F
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import tifffile

from src.models.resunet import ResUNet
from src.utils.checkpoint import load_checkpoint
from src.data.dataset import build_dataset

# Set page config
st.set_page_config(page_title="Segmentación de Pozos de Petróleo y Gas", layout="wide")

@st.cache_resource
def load_model():
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = ResUNet(in_channels=4, out_channels=1, encoder="resnet34")
    model.to(device)
    
    try:
        load_checkpoint("checkpoints/best.pt", model, device=device)
        model.eval()
        return model, device
    except FileNotFoundError:
        st.error("No se encontró el archivo de pesos 'checkpoints/best.pt'.")
        return None, device

model, device = load_model()

st.title("Segmentación de Pozos de Petróleo y Gas")

st.markdown("""
### Objetivo de la Aplicación
Esta aplicación web permite la detección y segmentación automática de pozos de petróleo y gas en imágenes satelitales multiespectrales. 

### Modelo Utilizado
La inferencia se realiza mediante una red neuronal **ResUNet**, que utiliza un codificador **ResNet-34** para la extracción robusta de características y una arquitectura U-Net para la segmentación precisa a nivel de píxel. El modelo procesa imágenes de 4 canales (RGB + Infrarrojo Cercano) y genera una máscara binaria con las infraestructuras detectadas.
""")

# Sidebar
st.sidebar.title("Opciones")
modo = st.sidebar.radio(
    "Selecciona el modo:",
    ("Cargar Base de Datos de Prueba", "Subir Imagen")
)

def run_inference(image_tensor, model, device):
    """Run inference on a single image tensor of shape (C, H, W)."""
    with torch.no_grad():
        x = image_tensor.unsqueeze(0).to(device) # (1, C, H, W)
        pred = model(x)
        pred_prob = torch.sigmoid(pred).squeeze().cpu().numpy() # (H, W)
        pred_mask = (pred_prob > 0.5).astype(np.uint8)
    return pred_mask, pred_prob

def normalize_image(img_arr):
    """Normalize a float image array robustly using percentiles."""
    p2 = np.percentile(img_arr, 2)
    p98 = np.percentile(img_arr, 98)
    if p98 > p2:
        img_arr = (img_arr - p2) / (p98 - p2)
    img_arr = np.clip(img_arr, 0, 1)
    return (img_arr * 255).astype(np.uint8)

def create_overlay(image_np, mask_np, color=(255, 0, 0), alpha=0.5):
    """Create an overlay of the mask on the image."""
    overlay = image_np.copy()
    mask_indices = mask_np > 0
    for c in range(3):
        overlay[mask_indices, c] = image_np[mask_indices, c] * (1 - alpha) + color[c] * alpha
    return overlay.astype(np.uint8)

if modo == "Subir Imagen":
    st.header("Subir una imagen para segmentación")
    uploaded_file = st.file_uploader("Sube una imagen (TIF)", type=["tif", "tiff"])
    
    if uploaded_file is not None:
        try:
            # Load image using tifffile to preserve 16-bit 4-channel accuracy
            uploaded_file.seek(0)
            img_arr_raw = tifffile.imread(uploaded_file)
            
            # Scale correctly based on data type
            if img_arr_raw.dtype == np.uint16 or img_arr_raw.dtype == np.int32:
                img_arr = img_arr_raw.astype(np.float32) / 65535.0
            else:
                img_arr = img_arr_raw.astype(np.float32) / 255.0
                
            # If image has only 2 dimensions (grayscale), add channel dim
            if len(img_arr.shape) == 2:
                img_arr = np.stack([img_arr]*3, axis=-1)
                
            # Resize using torch interpolate
            img_t_raw = torch.from_numpy(img_arr.transpose(2, 0, 1)).unsqueeze(0)
            img_t_resized = F.interpolate(img_t_raw, size=(256, 256), mode='bilinear', align_corners=False)
            img_arr = img_t_resized.squeeze(0).permute(1, 2, 0).numpy()
                
            # For display, only use RGB and normalize robustly
            rgb_display = img_arr[:, :, :3]
            rgb_display_uint8 = normalize_image(rgb_display)
            st.image(rgb_display_uint8, caption="Imagen Subida (RGB Normalizado)", use_container_width=True)
            
            # Model expects 4 channels. If RGB, add empty NIR.
            if img_arr.shape[2] == 3:
                nir_channel = np.zeros((256, 256, 1), dtype=np.float32)
                img_arr = np.concatenate([img_arr, nir_channel], axis=-1)
                st.warning("Se subió una imagen de 3 canales (RGB). Se agregó un canal NIR vacío (ceros) para el modelo.")
            elif img_arr.shape[2] == 4:
                st.success("Se subió una imagen de 4 canales. Utilizando el 4to canal como NIR.")
            elif img_arr.shape[2] > 4:
                img_arr = img_arr[:, :, :4]
                
            # Convert to tensor CHW
            image_tensor = torch.from_numpy(img_arr.transpose(2, 0, 1))
            
            if st.button("Realizar Segmentación"):
                if model:
                    with st.spinner("Procesando..."):
                        pred_mask, pred_prob = run_inference(image_tensor, model, device)
                        
                        col1, col2, col3 = st.columns(3)
                        with col1:
                            st.image(rgb_display_uint8, caption="Imagen Original", use_container_width=True)
                        with col2:
                            # Create a colorful mask overlay or just show mask
                            fig, ax = plt.subplots()
                            ax.imshow(pred_mask, cmap="gray")
                            ax.axis("off")
                            st.pyplot(fig)
                            st.markdown("<p style='text-align: center;'>Máscara Predicha</p>", unsafe_allow_html=True)
                        with col3:
                            overlay = create_overlay(rgb_display_uint8, pred_mask)
                            st.image(overlay, caption="Predicción Superpuesta", use_container_width=True)
                else:
                    st.error("El modelo no está cargado.")
        except Exception as e:
            st.error(f"Error procesando la imagen: {e}")

elif modo == "Cargar Base de Datos de Prueba":
    st.header("Explorar Base de Datos de Prueba")
    st.write("Esta sección carga imágenes de `data/val.bin`.")
    
    if 'wds_iter' not in st.session_state:
        try:
            dataset = build_dataset("data/val.bin", image_size=256, augmentation=False, training=False)
            st.session_state['wds_iter'] = iter(dataset)
            st.session_state['current_sample'] = None
        except Exception as e:
            st.error(f"Error cargando la base de datos: {e}")
            
    if 'wds_iter' in st.session_state:
        st.subheader("Filtro de Similitud")
        filter_good = True
        #filter_good = st.checkbox("Buscar la mejor predicción en los siguientes 50 ejemplos")
        
        if st.button("Cargar Siguiente Imagen"):
            max_attempts = 50 if filter_good else 1
            best_sample = None
            best_dice = -1.0
            
            with st.spinner("Buscando mejor predicción..." if filter_good else "Cargando..."):
                for _ in range(max_attempts):
                    try:
                        sample = next(st.session_state['wds_iter'])
                    except StopIteration:
                        st.warning("Se alcanzó el final de la base de datos. Reiniciando...")
                        dataset = build_dataset("data/val.bin", image_size=256, augmentation=False, training=False)
                        st.session_state['wds_iter'] = iter(dataset)
                        sample = next(st.session_state['wds_iter'])
                        
                    if not filter_good:
                        st.session_state['current_sample'] = sample
                        break
                    else:
                        # Evaluate dice
                        image_t = sample["image"]
                        mask_t = sample["mask"]
                        true_mask = mask_t.squeeze().numpy()
                        pred_mask, _ = run_inference(image_t, model, device)
                        
                        intersection = np.sum(pred_mask * true_mask)
                        union = np.sum(pred_mask) + np.sum(true_mask)
                        dice = 2.0 * intersection / (union + 1e-8)
                        
                        if dice > best_dice:
                            best_dice = dice
                            best_sample = sample
                            
                if filter_good and best_sample is not None:
                    st.session_state['current_sample'] = best_sample
                    #st.success(f"Mejor predicción encontrada (Dice Score: {best_dice:.4f})")
                
        sample = st.session_state.get('current_sample')
        if sample is not None:
            image_t = sample["image"] # (4, 256, 256)
            mask_t = sample["mask"]   # (1, 256, 256)
            
            # Extract RGB for visualization (first 3 channels), convert back from [0, 1] to uint8
            rgb_img_raw = image_t[:3, :, :].permute(1, 2, 0).numpy()
            rgb_img = normalize_image(rgb_img_raw)
            
            true_mask = mask_t.squeeze().numpy()
            
            # Run inference
            if model:
                pred_mask, pred_prob = run_inference(image_t, model, device)
                
                col1, col2, col3, col4 = st.columns(4)
                with col1:
                    st.image(rgb_img, caption="Imagen original", use_container_width=True)
                with col2:
                    fig, ax = plt.subplots()
                    ax.imshow(true_mask, cmap="gray")
                    ax.axis("off")
                    st.pyplot(fig)
                    st.markdown("<p style='text-align: center;'>Máscara Real</p>", unsafe_allow_html=True)
                with col3:
                    fig, ax = plt.subplots()
                    ax.imshow(pred_mask, cmap="gray")
                    ax.axis("off")
                    st.pyplot(fig)
                    st.markdown("<p style='text-align: center;'>Máscara Predicha</p>", unsafe_allow_html=True)
                with col4:
                    overlay = create_overlay(rgb_img, pred_mask)
                    st.image(overlay, caption="Predicción Superpuesta", use_container_width=True)
            else:
                st.error("El modelo no está cargado.")
