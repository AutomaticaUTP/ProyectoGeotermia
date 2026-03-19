import streamlit as st
import torch
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Set page configuration
st.set_page_config(page_title="ORC Dynamic Simulator", layout="wide")

# ==========================================
# 1. FLUID PROPERTIES DATABASE
# ==========================================
# Properties approximated for liquid/vapor saturation regions commonly used in ORC
FLUID_DATA = {
    "R245fa": {
        "Cp": 1.36,       # Specific Heat (kJ/kg*K)
        "Density": 1350,  # kg/m3 (Liquid)
        "T_crit": 427.2,  # Critical Temp (K)
        "Desc": "Common for low-grade waste heat recovery."
    },
    "Pentane": {
        "Cp": 2.32,
        "Density": 626,
        "T_crit": 469.7,
        "Desc": "Hydrocarbon, highly efficient but flammable."
    },
    "R134a": {
        "Cp": 1.41,
        "Density": 1206,
        "T_crit": 374.2,
        "Desc": "Common refrigerant, higher pressure."
    }
}

# ==========================================
# 2. PHYSICS MODEL (Differential Equations)
# ==========================================

class ORC_Model:
    def __init__(self, params, fluid_props):
        self.params = params
        self.fluid = fluid_props
        
        # System Constants
        self.C_evap = params['C_evap']   # Thermal inertia (kJ/K)
        self.C_cond = params['C_cond']   
        self.UA_evap = params['UA_evap'] # Heat Transfer (kW/K)
        self.UA_cond = params['UA_cond']
        
        # Operation
        self.tau_pump = params['tau_pump']
        self.target_flow = params['target_flow']
        self.T_source = params['T_source']
        self.T_sink = params['T_sink']
        self.eff_turb = params['eff_turb']

    def derivatives(self, t, state):
        """
        State Vector y:
        y[0] = T_evap(t)
        y[1] = T_cond(t)
        y[2] = m_tilde(t)
        """
        T_evap = state[0]
        T_cond = state[1]
        m_tilde = state[2]
        
        # Fluid Cp (Specific Heat Capacity)
        Cp = self.fluid['Cp']

        # --- 1. EVAPORATOR (Energy Balance) ---
        # Heat Input from Source
        Q_in = self.UA_evap * (self.T_source - T_evap)
        
        # Enthalpy leaving (Approximation: h = Cp * T)
        # Energy removed by fluid = mass_flow * delta_Enthalpy
        E_out_flow = m_tilde * Cp * (T_evap - T_cond) 
        
        dT_evap_dt = (Q_in - E_out_flow) / self.C_evap

        # --- 2. CONDENSER (Energy Balance) ---
        # Heat Rejection to Sink
        Q_out = self.UA_cond * (T_cond - self.T_sink)
        
        # Energy entering from Turbine (after work extraction)
        # We assume turbine drops enthalpy by factor of efficiency
        # This is a dynamic simplification for the dashboard
        E_in_flow = m_tilde * Cp * (T_evap - T_cond) * (1 - self.eff_turb)
        
        dT_cond_dt = (E_in_flow - Q_out) / self.C_cond

        # --- 3. PUMP (Momentum/Inertia) ---
        # First order lag model for fluid inertia
        dm_tilde_dt = (self.target_flow - m_tilde) / self.tau_pump

        return torch.stack([dT_evap_dt, dT_cond_dt, dm_tilde_dt])

    def get_metrics(self, state):
        """Calculate derived metrics for plotting"""
        T_evap, T_cond, m_tilde = state
        Cp = self.fluid['Cp']
        
        # Instantaneous Power
        # W_dot = m_dot * (h_in - h_out) * efficiency
        enthalpy_drop = Cp * (T_evap - T_cond)
        power_gen = m_tilde * enthalpy_drop * self.eff_turb
        
        # Heat Transfer Rates
        q_in = self.UA_evap * (self.T_source - T_evap)
        q_out = self.UA_cond * (T_cond - self.T_sink)
        
        return power_gen, q_in, q_out

# ==========================================
# 3. DASHBOARD INTERFACE
# ==========================================
st.title("Organic Rankine Cycle (ORC) Simulator")
st.markdown("### Interactive Learning Dashboard")
st.markdown("""
This tool simulates the **transient (time-dependent)** behavior of an ORC power plant. 
Use the sidebar to change the **Organic Fluid** and system parameters.
""")

# --- SIDEBAR ---
st.sidebar.header("1. Fluid Selection")
fluid_name = st.sidebar.selectbox("Choose Organic Fluid", list(FLUID_DATA.keys()))
current_fluid = FLUID_DATA[fluid_name]
st.sidebar.info(f"**{fluid_name}**\n\n$C_p$: {current_fluid['Cp']} kJ/kgK\n\n{current_fluid['Desc']}")

st.sidebar.header("2. Boundary Conditions")
T_source_C = st.sidebar.slider("Heat Source Temp $T_{source}$ (°C)", 80, 200, 120)
T_sink_C = st.sidebar.slider("Cooling Sink Temp $T_{sink}$ (°C)", 10, 40, 20)
target_flow = st.sidebar.slider("Pump Flow Target $\\tilde{m}_{target}$ (kg/s)", 0.1, 5.0, 1.5)

st.sidebar.header("3. System Inertia")
C_evap = st.sidebar.slider("Evaporator Thermal Mass (kJ/K)", 10.0, 200.0, 50.0)
tau_pump = st.sidebar.slider("Pump Spin-up Time (s)", 0.5, 10.0, 2.0)

# Constants
params = {
    'C_evap': C_evap, 'C_cond': 50.0,
    'T_source': T_source_C + 273.15, 'T_sink': T_sink_C + 273.15,
    'UA_evap': 5.0, 'UA_cond': 5.0,
    'eff_turb': 0.85, 'tau_pump': tau_pump, 'target_flow': target_flow
}

# ==========================================
# 4. SIMULATION EXECUTION
# ==========================================
dt = 0.1
sim_time = 60
t_eval = torch.linspace(0, sim_time, int(sim_time/dt))

# Init Model
model = ORC_Model(params, current_fluid)
state = torch.tensor([T_sink_C + 273.15, T_sink_C + 273.15, 0.0]) # Start at ambient, zero flow

# Lists for storage
hist_t, hist_T_evap, hist_T_cond, hist_m = [], [], [], []
hist_power, hist_qin, hist_qout = [], [], []

# Integration Loop
for t in t_eval:
    dydt = model.derivatives(t, state)
    state = state + dydt * dt
    
    # Calculate derived metrics
    p, qi, qo = model.get_metrics(state)
    
    # Store
    hist_t.append(t.item())
    hist_T_evap.append(state[0].item() - 273.15)
    hist_T_cond.append(state[1].item() - 273.15)
    hist_m.append(state[2].item())
    hist_power.append(p.item())
    hist_qin.append(qi.item())
    hist_qout.append(qo.item())

# ==========================================
# 5. VISUALIZATION ZONES
# ==========================================

# --- A. SYSTEM OVERVIEW (Global Equations) ---
st.markdown("---")
st.subheader("A. Governing Equations (Time-Dependent)")


st.markdown("#### 1. Evaporator")
st.latex(r"""
        \underbrace{C_{evap} \frac{dT_{evap}(t)}{dt}}_{\text{Rate of Temp Change}} = \underbrace{UA_{evap} (T_{source} - T_{evap}(t))}_{\text{Heat In from Source}} - \underbrace{\tilde{m}(t) C_p (T_{evap}(t) - T_{cond}(t))}_{\text{Energy Leaving with Fluid}}
""")
st.caption("Energy stored = Heat In - Energy carried away by fluid.")

c1, c2 = st.columns(2)
with c1:
    st.markdown("#### 2. Turbine (Power)")
    st.latex(r"""
    P_{electric}(t) = \tilde{m}(t) \cdot C_p \cdot (T_{evap}(t) - T_{cond}(t)) \cdot \eta_{turb}
    """)
    st.caption("Power depends on instantaneous mass flow and enthalpy drop.")

with c2:
    st.markdown("#### 3. Pump Dynamics")
    st.latex(r"""
    \underbrace{\tau_{pump} \frac{d\tilde{m}(t)}{dt}}_{\text{Acceleration Inertia}} = \underbrace{\tilde{m}_{target}}_{\text{Desired Flow}} - \underbrace{\tilde{m}(t)}_{\text{Current Flow}}
    """)
    st.caption("Flow rate $\\tilde{m}(t)$ cannot change instantly due to inertia.")

# --- B. COMPONENT SPECIFIC PLOTS ---
st.markdown("---")
st.subheader("B. Component Analysis")
st.markdown("Detailed breakdown of variables for each subsystem.")

# Create tabs for each component
tab_evap, tab_turb, tab_cond, tab_pump = st.tabs(["🔥 Evaporator", "⚡ Turbine", "❄️ Condenser", "💧 Pump"])

# Helper function for consistent plotting
def plot_component(x, y_list, labels, title, y_label, colors):
    fig, ax = plt.subplots(figsize=(10, 4))
    for y, lab, col in zip(y_list, labels, colors):
        ax.plot(x, y, label=lab, color=col, linewidth=2)
    ax.set_title(title)
    ax.set_xlabel("Time (s)")
    ax.set_ylabel(y_label)
    ax.grid(True, alpha=0.3)
    ax.legend()
    return fig

with tab_evap:
    col_a, col_b = st.columns([3, 1])
    with col_a:
        st.pyplot(plot_component(
            hist_t, 
            [hist_T_evap, [T_source_C]*len(hist_t)], 
            [r"$T_{evap}(t)$", r"$T_{source}$ (Const)"], 
            "Evaporator Temperature Response", 
            "Temperature (°C)", 
            ['red', 'orange']
        ))
    with col_b:
        st.metric("Final Evap Temp", f"{hist_T_evap[-1]:.1f} °C")
        st.metric("Heat Input Rate", f"{hist_qin[-1]:.1f} kW")
        st.markdown("**Observation:** Notice how $T_{evap}(t)$ rises asymptotically towards the source temperature.")

with tab_turb:
    col_a, col_b = st.columns([3, 1])
    with col_a:
        st.pyplot(plot_component(
            hist_t, 
            [hist_power], 
            [r"Net Power $P_{out}(t)$"], 
            "Turbine Power Generation", 
            "Power (kW)", 
            ['gold']
        ))
    with col_b:
        st.metric("Max Power", f"{max(hist_power):.2f} kW")
        st.markdown(f"**Fluid:** {fluid_name}")
        st.markdown("**Observation:** Power is zero at $t=0$ and rises as flow $\\tilde{m}(t)$ and $\Delta T(t)$ develop.")

with tab_cond:
    col_a, col_b = st.columns([3, 1])
    with col_a:
        st.pyplot(plot_component(
            hist_t, 
            [hist_T_cond, [T_sink_C]*len(hist_t)], 
            [r"$T_{cond}(t)$", r"$T_{sink}$ (Const)"], 
            "Condenser Temperature Response", 
            "Temperature (°C)", 
            ['blue', 'cyan']
        ))
    with col_b:
        st.metric("Final Cond Temp", f"{hist_T_cond[-1]:.1f} °C")
        st.metric("Heat Rejection", f"{hist_qout[-1]:.1f} kW")

with tab_pump:
    col_a, col_b = st.columns([3, 1])
    with col_a:
        st.pyplot(plot_component(
            hist_t, 
            [hist_m, [target_flow]*len(hist_t)], 
            [r"Actual Flow $\tilde{m}(t)$", r"Target $\tilde{m}_{set}$"], 
            "Pump Flow Dynamics", 
            "Mass Flow (kg/s)", 
            ['green', 'grey']
        ))
    with col_b:
        st.metric("Current Flow", f"{hist_m[-1]:.2f} kg/s")
        st.markdown(f"**Inertia (Tau):** {tau_pump} s")
        st.markdown("**Observation:** The pump has a delay. It takes approximately $3 \\times \\tau$ to reach 95% of target flow.")

st.markdown("---")
st.caption("Simulation powered by PyTorch | Lumped Parameter Model")