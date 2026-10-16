import os
import numpy as np
import joblib

from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, PolynomialFeatures
from sklearn.linear_model import BayesianRidge
from src.results import evaluate_regression, plot_real_vs_predicted


# ============================================================
# MODELO BAYESIAN RIDGE
# ============================================================

def build_bayesian_model(polynomial_degree=1):
    """
    Construye un modelo Bayesian Ridge.

    polynomial_degree = 1 -> modelo lineal
    polynomial_degree = 2 -> modelo cuadrático
    polynomial_degree = 3 -> modelo cúbico
    """

    model = Pipeline([
        (
            "poly",
            PolynomialFeatures(
                degree=polynomial_degree,
                include_bias=False
            )
        ),
        (
            "scaler",
            StandardScaler()
        ),
        (
            "model",
            BayesianRidge()
        )
    ])

    return model


# ============================================================
# ENTRENADOR BAYESIANO
# ============================================================

class BayesianModelTrainer:

    def __init__(
        self,
        target_name,
        test_size=0.20,
        random_state=42,
        polynomial_degree=1
    ):

        self.target_name = target_name
        self.test_size = test_size
        self.random_state = random_state
        self.polynomial_degree = polynomial_degree

        self.model = None

        self.X_train = None
        self.X_test = None
        self.y_train = None
        self.y_test = None

        self.results = []


    # ========================================================
    # ENTRENAMIENTO Y EVALUACIÓN
    # ========================================================

    def train_and_evaluate(
        self,
        X,
        y,
        figure_prefix=None
    ):

        (
            self.X_train,
            self.X_test,
            self.y_train,
            self.y_test
        ) = train_test_split(
            X,
            y,
            test_size=self.test_size,
            random_state=self.random_state
        )

        print("\n" + "=" * 70)
        print(
            f"Entrenando Bayesian Ridge "
            f"(grado {self.polynomial_degree}) "
            f"para {self.target_name}"
        )
        print("=" * 70)

        # Crear modelo
        self.model = build_bayesian_model(
            polynomial_degree=self.polynomial_degree
        )

        # Entrenar
        self.model.fit(
            self.X_train,
            self.y_train
        )

        # ----------------------------------------------------
        # Predicción entrenamiento
        # ----------------------------------------------------

        y_train_pred = self.model.predict(
            self.X_train
        )

        y_train_pred = np.maximum(
            y_train_pred,
            0
        )

        result_train = evaluate_regression(
            y_true=self.y_train,
            y_pred=y_train_pred,
            model_name=f"Bayesian Ridge grado {self.polynomial_degree}",
            target_name=self.target_name,
            dataset_name="train"
        )

        # ----------------------------------------------------
        # Predicción prueba
        # ----------------------------------------------------

        y_test_pred = self.model.predict(
            self.X_test
        )

        y_test_pred = np.maximum(
            y_test_pred,
            0
        )

        result_test = evaluate_regression(
            y_true=self.y_test,
            y_pred=y_test_pred,
            model_name=f"Bayesian Ridge grado {self.polynomial_degree}",
            target_name=self.target_name,
            dataset_name="test"
        )

        self.results = [
            result_train,
            result_test
        ]

        print("\nResultados entrenamiento:")
        print(result_train)

        print("\nResultados prueba:")
        print(result_test)

        # ----------------------------------------------------
        # Gráfica
        # ----------------------------------------------------

        if figure_prefix is not None:

            target_safe = (
                self.target_name
                .replace(" ", "_")
                .replace("/", "_")
            )

            plot_real_vs_predicted(
                y_true=self.y_test,
                y_pred=y_test_pred,
                title=(
                    f"Bayesian Ridge grado "
                    f"{self.polynomial_degree} - "
                    f"{self.target_name} - Test"
                ),
                xlabel="Valor real [kW]",
                ylabel="Valor predicho [kW]",
                path=(
                    f"figures/"
                    f"{figure_prefix}_"
                    f"{target_safe}_"
                    f"bayesian_grado_"
                    f"{self.polynomial_degree}_test.png"
                )
            )

        return self.results


    # ========================================================
    # PREDICCIÓN NORMAL
    # ========================================================

    def predict(self, X):

        if self.model is None:
            raise RuntimeError(
                "Primero debes entrenar el modelo."
            )

        y_pred = self.model.predict(X)

        y_pred = np.maximum(
            y_pred,
            0
        )

        return y_pred


    # ========================================================
    # PREDICCIÓN CON INCERTIDUMBRE
    # ========================================================

    def predict_with_uncertainty(self, X):

        if self.model is None:
            raise RuntimeError(
                "Primero debes entrenar el modelo."
            )

        # Aplicar automáticamente:
        # PolynomialFeatures -> StandardScaler
        preprocessor = self.model[:-1]

        X_transformed = preprocessor.transform(X)

        # Bayesian Ridge
        bayesian_model = self.model.named_steps["model"]

        y_mean, y_std = bayesian_model.predict(
            X_transformed,
            return_std=True
        )

        y_mean = np.maximum(
            y_mean,
            0
        )

        return y_mean, y_std


    # ========================================================
    # GUARDAR MODELO
    # ========================================================

    def save_model(self, path):

        if self.model is None:
            raise RuntimeError(
                "No hay modelo entrenado para guardar."
            )

        os.makedirs(
            os.path.dirname(path),
            exist_ok=True
        )

        joblib.dump(
            {
                "model": self.model,
                "target_name": self.target_name,
                "polynomial_degree": self.polynomial_degree
            },
            path
        )