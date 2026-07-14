import os
import numpy as np
import joblib

from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import BayesianRidge
from sklearn.ensemble import (
    RandomForestRegressor,
    ExtraTreesRegressor,
    GradientBoostingRegressor
)
from sklearn.svm import SVR

from src.results import evaluate_regression, plot_real_vs_predicted


def build_model_dictionary(random_state=42):
    """
    Diccionario de modelos a comparar.
    """

    models = {
        "Bayesian Ridge": Pipeline([
            ("scaler", StandardScaler()),
            ("model", BayesianRidge())
        ])

        # "Random Forest": RandomForestRegressor(
        #     n_estimators=300,
        #     random_state=random_state,
        #     min_samples_leaf=2
        # ),

        # "Extra Trees": ExtraTreesRegressor(
        #     n_estimators=300,
        #     random_state=random_state,
        #     min_samples_leaf=2
        # ),

        # "Gradient Boosting": GradientBoostingRegressor(
        #     n_estimators=300,
        #     learning_rate=0.03,
        #     max_depth=3,
        #     random_state=random_state
        # ),

        # "SVR RBF": Pipeline([
        #     ("scaler", StandardScaler()),
        #     ("model", SVR(
        #         kernel="rbf",
        #         C=10.0,
        #         gamma="scale",
        #         epsilon=0.1
        #     ))
        # ])
    }

    return models


class SingleTargetModelTrainer:
    """
    Entrena modelos de regresión para una sola salida.

    Se usa una vez para Pmax conceptual y otra vez para P_real_ORC.
    """

    def __init__(
        self,
        target_name,
        test_size=0.2,
        random_state=42
    ):
        self.target_name = target_name
        self.test_size = test_size
        self.random_state = random_state

        self.models = {}
        self.results = []

        self.best_model = None
        self.best_model_name = None
        self.best_rmse = np.inf

        self.X_train = None
        self.X_test = None
        self.y_train = None
        self.y_test = None

    def train_and_evaluate(self, X, y, figure_prefix=None):
        """
        Entrena varios modelos, evalúa en train y test,
        y selecciona el mejor según RMSE de test.
        """

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

        models = build_model_dictionary(
            random_state=self.random_state
        )

        for model_name, model in models.items():
            print(f"\nEntrenando {model_name} para {self.target_name}...")

            model.fit(self.X_train, self.y_train)

            # ============================================
            # Predicción en entrenamiento
            # ============================================

            y_train_pred = model.predict(self.X_train)
            y_train_pred = np.maximum(y_train_pred, 0)

            result_train = evaluate_regression(
                y_true=self.y_train,
                y_pred=y_train_pred,
                model_name=model_name,
                target_name=self.target_name,
                dataset_name="train"
            )

            # ============================================
            # Predicción en test
            # ============================================

            y_test_pred = model.predict(self.X_test)
            y_test_pred = np.maximum(y_test_pred, 0)

            result_test = evaluate_regression(
                y_true=self.y_test,
                y_pred=y_test_pred,
                model_name=model_name,
                target_name=self.target_name,
                dataset_name="test"
            )

            self.results.append(result_train)
            self.results.append(result_test)

            self.models[model_name] = model

            # El mejor modelo se escoge por RMSE en test
            if result_test["RMSE"] < self.best_rmse:
                self.best_rmse = result_test["RMSE"]
                self.best_model = model
                self.best_model_name = model_name

            if figure_prefix is not None:
                safe_name = model_name.replace(" ", "_").replace("/", "_")
                target_safe = self.target_name.replace(" ", "_").replace("/", "_")

                plot_real_vs_predicted(
                    y_true=self.y_test,
                    y_pred=y_test_pred,
                    title=f"{model_name} - {self.target_name} - Test",
                    xlabel="Valor real [kW]",
                    ylabel="Valor predicho [kW]",
                    path=f"figures/{figure_prefix}_{target_safe}_{safe_name}_test.png"
                )

        print(
            f"\nMejor modelo para {self.target_name}: "
            f"{self.best_model_name} | RMSE test = {self.best_rmse:.4f}"
        )

        return self.results

    def predict(self, X):
        """
        Predice usando el mejor modelo.
        """

        if self.best_model is None:
            raise RuntimeError("Primero debes entrenar el modelo.")

        y_pred = self.best_model.predict(X)
        y_pred = np.maximum(y_pred, 0)

        return y_pred

    def predict_with_model(self, X, model_name):
        """
        Predice usando un modelo específico ya entrenado.
        """

        if model_name not in self.models:
            raise ValueError(f"No existe el modelo '{model_name}' entrenado.")

        model = self.models[model_name]
        y_pred = model.predict(X)
        y_pred = np.maximum(y_pred, 0)

        return y_pred

    def predict_with_uncertainty(self, X, model_name="Bayesian Ridge"):
        """
        Predice media y desviación estándar con un modelo específico.
        Solo funciona si el modelo es Bayesian Ridge.
        """

        if model_name not in self.models:
            raise ValueError(f"No existe el modelo '{model_name}' entrenado.")

        model_pipeline = self.models[model_name]

        if model_name != "Bayesian Ridge":
            raise ValueError(
                "La incertidumbre solo está implementada para Bayesian Ridge."
            )

        scaler = model_pipeline.named_steps["scaler"]
        model = model_pipeline.named_steps["model"]

        X_scaled = scaler.transform(X)

        y_mean, y_std = model.predict(X_scaled, return_std=True)

        y_mean = np.maximum(y_mean, 0)

        return y_mean, y_std

    def save_best_model(self, path):
        """
        Guarda el mejor modelo.
        """

        if self.best_model is None:
            raise RuntimeError("No hay modelo entrenado para guardar.")

        os.makedirs(os.path.dirname(path), exist_ok=True)

        joblib.dump(
            {
                "model": self.best_model,
                "model_name": self.best_model_name,
                "target_name": self.target_name,
                "best_rmse": self.best_rmse
            },
            path
        )