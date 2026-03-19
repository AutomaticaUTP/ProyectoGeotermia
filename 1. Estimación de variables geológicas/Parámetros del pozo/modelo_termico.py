# %%
import numpy as np
import matplotlib.pyplot as plt

"""
================================================================================
MODELO TÉRMICO DE POZO VERTICAL (ESTILO RAMEY / LINE-SOURCE)
================================================================================

Objetivo
----------------------------
Este script estima la temperatura de un fluido que circula por un pozo vertical
a medida que baja o sube, intercambiando calor con la roca (formación).

Qué calcula:
1) El perfil de temperatura del fluido a lo largo del pozo: T(z)
2) La temperatura de salida del pozo a lo largo del tiempo: Tout(t)

Fundamento físico:
--------------------------------
- La roca alrededor del pozo tiene una temperatura que aumenta con la profundidad
  (gradiente geotérmico).
- El fluido entra al pozo con una temperatura Tin.
- A medida que se mueve, el fluido tiende a acercarse a la temperatura de la roca.
- Qué tan rápido se “acerca” depende de:
  a) Cuánto calor puede intercambiar con la roca (UA' = 1 / resistencia)
  b) Cuánta “inercia térmica” trae el flujo (m_dot * cp)

Supuestos importantes (simplificaciones):
-----------------------------------------
- La temperatura de formación se asume lineal con la profundidad.
- El intercambio térmico se modela SOLO con una resistencia de conducción en la roca,
  transitoria en el tiempo (forma logarítmica tipo Ramey).
- No se incluyen resistencias de tubería/cemento ni convección interna explícita.
- Propiedades constantes (roca y fluido).

Cómo se usa:
------------
- Puedes llamar a run_time_series(t_years, Tin, ...) pasando series de tiempo.
- El bloque __main__ trae un ejemplo listo para ejecutar con gráficos.

Nota clave:
-----------
Este modelo NO está “limitado al agua”.
El ejemplo usa cpfluid=4180 (agua), pero tú puedes usar el cp del fluido o mezcla
que corresponda (o un cp efectivo de mezcla agua-petróleo).
"""

# Segundos en un año 
SEC_IN_YEAR = 365 * 24 * 3600.0


def formation_resistance_per_length(
    t_seconds: float,
    r: float,
    krock: float,
    rhorock: float,
    cprock: float,
    Kfac: float = 1.4986,
) -> float:
    """
    Calcula la resistencia térmica "de la formación" por cada metro de pozo (K·m/W).

    ¿Qué significa "resistencia térmica por metro"?
    ----------------------------------------------
    En otras palabras, “Qué tan difícil es pasar calor entre el pozo y la roca”,
    pero expresado por unidad de longitud del pozo.

    ¿Por qué depende del tiempo?
    ----------------------------
    Porque el calentamiento/enfriamiento de la roca no ocurre instantáneamente:
    el calor se difunde radialmente hacia la roca con el tiempo.
    La zona afectada por la conducción crece aproximadamente como:
        radio_térmico ~ sqrt(alpha * t)

    donde alpha es la difusividad térmica.

    Fórmula usada (tipo Ramey / line-source):
    -----------------------------------------
        Rf'(t) = ln( Kfac * sqrt(alpha*t) / r ) / (2*pi*krock)

    Variables:
    ----------
    - t_seconds [s] : tiempo transcurrido en segundos
    - r [m]         : radio efectivo del pozo (o radio característico de intercambio)
    - krock [W/m/K] : conductividad térmica de la roca
    - rhorock [kg/m3], cprock [J/kg/K] : propiedades para calcular alpha
    - Kfac [-]      : constante clásica del modelo (factor de ajuste)

    Devuelve:
    ---------
    - Rf_prime [K·m/W] : resistencia térmica por metro de pozo

    "Sanity checks" y consideraciones:
    -----------------------
    - Evitamos t=0 porque produciría sqrt(alpha*t)=0 y log(...) inválido.
    - Forzamos el argumento del log a ser > 1 para no obtener log(<=1).
    """
    # Difusividad térmica de la roca [m^2/s].
    # Intuición: a mayor alpha, más rápido se propaga el calor en la roca.
    alpha = krock / (rhorock * cprock)

    # Evitar t=0 o tiempos absurdamente pequeños:
    t_seconds = max(float(t_seconds), 1.0)

    # Argumento dentro del log:
    # sqrt(alpha*t) es una medida del “radio térmico” alcanzado por la difusión.
    arg = Kfac * np.sqrt(alpha * t_seconds) / r

    # Asegurar que no sea <= 1 (porque ln(1)=0 y ln(<1) sería negativo):
    arg = max(float(arg), 1.000001)

    # Resistencia térmica transitoria por metro:
    return float(np.log(arg) / (2.0 * np.pi * krock))


def solve_well_profile_at_time(
    *,
    D: float,
    npts: int,
    direction: str,
    Tin: float,
    T_surface: float,
    geothermal_gradient: float,
    t_years: float,
    # Propiedades de la roca
    krock: float,
    rhorock: float,
    cprock: float,
    # Geometría
    r: float,
    # Fluido/flujo
    mrate_kg_per_s: float,
    cpfluid: float,
    # Constante dentro del log
    Kfac: float = 1.4986,
):
    """
    Resuelve el perfil de temperatura del fluido a lo largo del pozo para un tiempo específico.

    Contexto:
    ---------
    Tenemos un pozo vertical de profundidad D. La profundidad z se mide desde la superficie:
        z = 0 en la superficie
        z = D en el fondo

    La roca (formación) tiene una temperatura que aumenta con z (gradiente geotérmico):
        Tf(z) = T_surface + G*z
    donde:
        G = geothermal_gradient [°C/m]

    Modelo térmico del fluido:
    --------------------------
    Este script asume que, a lo largo del recorrido, la temperatura del fluido T(s)
    evoluciona con una ecuación de “relajación” hacia la temperatura de la roca:
        dT/ds = a * (Tf(s) - T)

    Interpretación de a:
    --------------------
    a es un "qué tan fuerte" es el intercambio térmico por metro:
        a = UA' / (m_dot * cp)

    - UA' (W/K/m) representa cuánto calor se puede transferir por metro por diferencia de temperatura.
    - m_dot*cp (W/K) representa cuánta energía necesita el flujo para cambiar 1 K
      (o sea, su inercia térmica).

    En este modelo:
    ---------------
    Se toma:
        R_total' ≈ Rf'(t)
    (solo la resistencia transitoria de conducción en la roca)

    Nota:
    -----
    Si quisieras un modelo más realista, podrías sumar resistencias:
        R_total' = R_interna + R_tuberia + R_cemento + Rf'(t)

    Entradas:
    ---------
    - D [m]                  : profundidad total
    - npts [-]               : número de puntos discretos en z
    - direction ["up"/"down"]: sentido del flujo
    - Tin [°C]               : temperatura de entrada
    - T_surface [°C]         : temperatura en superficie de la formación
    - geothermal_gradient [°C/m]
    - t_years [años]         : tiempo para evaluar la resistencia transitoria
    - krock, rhorock, cprock : propiedades roca
    - r [m]                  : radio característico
    - mrate_kg_per_s [kg/s]  : caudal másico del fluido
    - cpfluid [J/kg/K]       : calor específico del fluido

    Devuelve:
    ---------
    - z [m]              : arreglo de profundidades
    - Tfluid(z) [°C]     : temperatura del fluido en cada z
    - Tout [°C]          : temperatura en la salida (superficie o fondo según direction)
    - Tf(z) [°C]         : temperatura de formación en cada z
    - a [1/m]            : coeficiente espacial
    - Rf_prime [K·m/W]   : resistencia transitoria por metro evaluada en t
    """
    # Convertimos el tiempo en años a segundos (para la fórmula transitoria)
    t_seconds = float(t_years) * SEC_IN_YEAR

    # Caudal másico del fluido (kg/s)
    mdot = float(mrate_kg_per_s)

    # m_dot * cp = “capacidad térmica” del flujo (W/K).
    # Si esto es grande, el fluido cambia menos su temperatura por metro.
    mcp = mdot * float(cpfluid)

    # Resistencia transitoria de la formación por metro de pozo en este tiempo
    Rf_prime = formation_resistance_per_length(
        t_seconds=t_seconds,
        r=r,
        krock=krock,
        rhorock=rhorock,
        cprock=cprock,
        Kfac=Kfac,
    )

    # Conductancia por metro (W/K/m): a mayor UA', más fácil es transferir calor
    UA_prime = 1.0 / Rf_prime

    # Coeficiente espacial a [1/m]
    # a grande => T se acerca rápido a Tf
    # a pequeño => T cambia lentamente
    a = UA_prime / mcp

    # Creamos una malla en profundidad desde 0 hasta D
    z = np.linspace(0.0, float(D), int(npts))

    # Gradiente geotérmico G [°C/m]
    G = float(geothermal_gradient)

    # Temperatura de formación en cada profundidad
    Tf = float(T_surface) + G * z

    # Normalizamos el texto del sentido de flujo
    direction = direction.lower().strip()

    if direction == "down":
        # ---------------------------------------------------------------------
        # CASO "down": el fluido entra en superficie (z=0) y sale en el fondo (z=D)
        # ---------------------------------------------------------------------
        # Usamos una coordenada de recorrido s que coincide con z:
        #   s = 0 en superficie
        #   s = D en fondo
        s = z

        # Formación en función de s (es lo mismo que Tf(z) aquí):
        Tf_s = float(T_surface) + G * s

        # Solución analítica para Tf(s) = Tf0 + G*s (lineal creciente):
        #
        # EDO: dT/ds = a (Tf(s) - T)
        # Solución:
        #   T(s) = Tf0 + G*s - (G/a) + (Tin - Tf0 + (G/a)) * exp(-a*s)
        #
        # Interpretación:
        # - El término exp(-a*s) indica cómo la memoria de Tin desaparece con la distancia.
        # - Para s grande, T(s) tiende a seguir una línea cercana a Tf(s) con un desfase ~G/a.
        Tfluid = Tf_s - (G / a) + (float(Tin) - float(T_surface) + (G / a)) * np.exp(-a * s)

        # En "down", la salida es el último punto (fondo)
        Tout = float(Tfluid[-1])

    elif direction == "up":
        # ---------------------------------------------------------------------
        # CASO "up": el fluido entra en el fondo (z=D) y sale en superficie (z=0)
        # ---------------------------------------------------------------------
        # Definimos s como distancia recorrida desde el fondo:
        #   s = 0 en el fondo (z=D)
        #   s = D en superficie (z=0)
        s = float(D) - z

        # Temperatura de formación en el fondo:
        Tf_bottom = float(T_surface) + G * float(D)

        # Formación vista en función de s:
        # subiendo (aumenta s), z disminuye, entonces Tf baja linealmente:
        #   Tf(s) = Tf_bottom - G*s
        Tf_s = Tf_bottom - G * s

        # Solución analítica para Tf(s) = Tf_bottom - G*s (lineal decreciente):
        #
        #   T(s) = Tf_bottom - G*s + (G/a) + (Tin - Tf_bottom - (G/a)) * exp(-a*s)
        #
        # Similar interpretación: el exp(-a*s) “desvanece” la condición de entrada.
        Tfluid = Tf_s + (G / a) + (float(Tin) - Tf_bottom - (G / a)) * np.exp(-a * s)

        # En "up", la salida es en superficie (z=0).
        # Como z va de 0 a D, el punto z=0 corresponde al índice 0.
        Tout = float(Tfluid[0])

    else:
        raise ValueError("direction must be 'down' (inlet at wellhead) or 'up' (inlet at bottomhole).")

    return z, Tfluid, Tout, Tf, a, Rf_prime


def run_time_series(
    *,
    t_years: np.ndarray,
    Tin: np.ndarray,
    D: float = 5000.0,
    npts: int = 501,
    direction: str = "up",
    # Formación
    T_surface: float = 15.0,
    geothermal_gradient: float = 0.03,  # °C/m (30 °C/km)
    # Roca
    krock: float = 3.0,
    rhorock: float = 2663.0,
    cprock: float = 1112.0,
    # Geometría
    r: float = 0.078,
    # Fluido/flujo
    rho_w: float = 1000.0,   # kg/m3 (agua)
    rho_o: float = 850.0,    # kg/m3 (petróleo)
    cp_w: float  = 4180.0,   # J/kg/K (agua)
    cp_o: float  = 2200.0,   # J/kg/K (petróleo)
    phi_w: float = 0.9,      # water cut 
    mrate_kg_per_s: float = 100,
    # Constante del modelo
    Kfac: float = 1.4986,
    store_profiles: bool = True,
):
    """
    Ejecuta el modelo para una serie de tiempo Tin(t).

    ¿Qué hace esta función?
    -----------------------
    Recorre los tiempos t_years y para cada uno:
    1) resuelve el perfil T(z) usando solve_well_profile_at_time(...)
    2) guarda la temperatura de salida Tout(t)
    3) opcionalmente guarda todo el perfil T(z,t) en una matriz Tzt

    Entradas:
    ---------
    - t_years [años] : arreglo de tiempos (debe ser > 0)
    - Tin [°C]       : arreglo de temperatura de entrada (misma longitud que t_years)
    - store_profiles : si True, guarda todos los perfiles T(z) en el tiempo

    Salidas:
    --------
    - z [m]          : malla de profundidad
    - Tout_ts [°C]   : temperatura de salida en función del tiempo
    - Tf [°C]        : perfil de temperatura de formación (constante en el tiempo aquí)
    - Tzt [°C]       : matriz (nt x nz) con T(z,t) si store_profiles=True
                       si store_profiles=False, devuelve None
    """
    # Convertimos entradas a arreglos numpy con float
    t_years = np.asarray(t_years, dtype=float)
    Tin = np.asarray(Tin, dtype=float)

    # Verificación básica de dimensiones
    if t_years.shape != Tin.shape:
        raise ValueError("t_years and Tin must have the same shape/length.")

    # En este modelo, t debe ser > 0 por el log de la resistencia transitoria
    if np.any(t_years <= 0.0):
        raise ValueError("All t_years must be > 0 (e.g., start at 0.01 years) to avoid log singularity.")

    # Aquí guardaremos Tout(t)
    Tout_ts = np.zeros_like(t_years)

    # Variables para guardar la malla z y Tf una sola vez
    z_out = None
    Tf_out = None

    # Matriz opcional para guardar T(z,t)
    Tzt = None
    if store_profiles:
        Tzt = np.zeros((len(t_years), int(npts)), dtype=float)

    # Iteramos sobre el tiempo
    for i, (ty, ti) in enumerate(zip(t_years, Tin)):
         # convertir a fracción másica
        w_w_mass = (phi_w * rho_w) / (phi_w * rho_w + (1.0 - phi_w) * rho_o)

        # cp efectivo de mezcla (promedio másico)
        cp_mix = w_w_mass * cp_w + (1.0 - w_w_mass) * cp_o

        # Resolvemos el perfil espacial para este tiempo y Tin
        z, Tfluid, Tout, Tf, a, Rf_prime = solve_well_profile_at_time(
            D=D,
            npts=npts,
            direction=direction,
            Tin=ti,
            T_surface=T_surface,
            geothermal_gradient=geothermal_gradient,
            t_years=ty,
            krock=krock,
            rhorock=rhorock,
            cprock=cprock,
            r=r,
            mrate_kg_per_s=mrate_kg_per_s,
            cpfluid=cp_mix,
            Kfac=Kfac,
        )

        # Guardamos la salida en el tiempo
        Tout_ts[i] = Tout

        # Si queremos, guardamos el perfil completo T(z)
        if store_profiles:
            Tzt[i, :] = Tfluid

        # Guardamos z y Tf solo una vez (no cambian con el tiempo aquí)
        if z_out is None:
            z_out = z
            Tf_out = Tf

    return z_out, Tout_ts, Tf_out, Tzt


# ------------------------------------------------------------
# Ejemplo de uso (se ejecuta solo si corres este archivo directamente)
# ------------------------------------------------------------
if __name__ == "__main__":
    # Creamos un vector de tiempo en años.
    # Debe iniciar > 0 para evitar problemas con el log en t=0.
    t_years = np.linspace(0.1, 30, 100)

    # Ejemplo de historia de Tin(t) [°C]
    # Opción 1: constante
    # Tin = np.full_like(t_years, 60.0)

    # Opción 2: disminuye linealmente de 100 a 85 °C en la ventana
    Tin = 100.0 - 15.0 * (t_years - t_years.min()) / (t_years.max() - t_years.min())

    # Sentido del flujo:
    # - "up": entra en fondo (z=D) y sale en superficie (z=0)
    # - "down": entra en superficie (z=0) y sale en fondo (z=D)
    direction = "up"

    # Ejecutamos la simulación
    z, Tout_ts, Tf, Tzt = run_time_series(
        t_years=t_years,
        Tin=Tin,
        D=2000.0,              # profundidad del pozo [m]
        npts=501,              # puntos espaciales (más puntos => perfil más suave)
        direction=direction,
        T_surface=15.0,        # temperatura de formación en superficie [°C]
        geothermal_gradient=0.03,  # 30 °C/km
        krock=3.0,             # conductividad roca [W/m/K]
        rhorock=2663.0,        # densidad roca [kg/m^3]
        cprock=1112.0,         # cp roca [J/kg/K]
        r=0.078,               # radio efectivo [m]
        mrate_kg_per_s=25,     # caudal másico [kg/s]
        store_profiles=True,   # guardar perfiles T(z,t)
    )

    outlet_label = "Salida en cabeza de pozo (z=0)" if direction == "up" else "Salida en fondo (z=D)"

    # Si quisieras imprimir valores:
    # print(f"{outlet_label} temperaturas:")
    # for ty, ti, to in zip(t_years, Tin, Tout_ts):
    #     print(f"  t = {ty:6.2f} años | Tin = {ti:7.2f} °C -> Tout = {to:7.2f} °C")

    # -------------------------------------------------------------------------
    # 1) Gráfico: Tin(t) y Tout(t)
    # -------------------------------------------------------------------------
    plt.figure()
    plt.plot(t_years, Tin, "k--", label="Tin(t) (entrada)")
    plt.plot(t_years, Tout_ts, "ro-", markersize=3, label="Tout(t) (salida)")
    plt.xlabel("tiempo (años)")
    plt.ylabel("Temperatura (°C)")
    plt.title(f"Temperatura de entrada y salida vs tiempo\n({outlet_label})")
    plt.grid(True)
    plt.legend()
    plt.show()

    # -------------------------------------------------------------------------
    # 2) Gráfico: perfil de formación Tf(z) y algunos perfiles del fluido T(z)
    # -------------------------------------------------------------------------
    plt.figure()
    plt.plot(Tf, z, "--", label="Temperatura de formación (Tf(z))")

    # Elegimos 3 tiempos: inicio, mitad, final (índices)
    for idx in [0, len(t_years)//2, -1]:
        plt.plot(Tzt[idx, :], z, label=f"Temp. fluido T(z) en t={t_years[idx]:.2f} años")

    # Convención típica: profundidad hacia abajo (invertimos eje y)
    plt.gca().invert_yaxis()
    plt.xlabel("Temperatura (°C)")
    plt.ylabel("Profundidad z (m)")
    plt.title("Perfiles de temperatura a lo largo del pozo")
    plt.grid(True)
    plt.legend()
    plt.show()
    # %%