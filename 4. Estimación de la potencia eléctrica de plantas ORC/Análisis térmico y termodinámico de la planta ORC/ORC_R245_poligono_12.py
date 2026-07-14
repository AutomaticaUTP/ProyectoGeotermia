import CoolProp.CoolProp as CP
import pandas as pd
import numpy as np


# ========================================
# DATOS DE CAMPOS
# ========================================


data = {
    "Campo": [
        "Caribe","Churucayo","Cohembi","Costayaco",
        "Cumplidor","Loro","Mansoya","Nancy",
        "Orito","Quinde","Quiriyana",
        "San Antonio","Sucio","Sucumbios"
    ],


    "BLD":[
        1072.69,1671.61,39062.15,34839.18,
        0.65,2310.4,6.29,36.34,
        17020.05,142.13,149.04,
        1626.03,679.44,38.06
    ],


    "T_prod":[
        60,65,66,89.44,
        56.67,36.42,62,62,
        62.92,61.5,62,
        26.51,53.8,64
    ]
}


df = pd.DataFrame(data)


# ========================================
# AGUA DE PRODUCCIÓN
# ========================================


rho_w = 1002
cp_w = 4050        # J/kgK


bbl_to_m3 = 0.158987


df["m3_day"] = df["BLD"] * bbl_to_m3
df["m3_s"] = df["m3_day"] / 86400
df["m_dot_w"] = df["m3_s"] * rho_w


# ========================================
# FLUIDO ORC
# ========================================


fluid = "R245fa"


eta_turb = 0.80
eta_pump = 0.75


pinch = 8
subcooling = 5
superheat = 5


Tcond = 30 + 273.15


# ========================================
# PRESIÓN CONDENSADOR
# ========================================


P_low = CP.PropsSI(
    "P",
    "T",
    Tcond,
    "Q",
    0,
    fluid
)


# ========================================
# RESULTADOS
# ========================================


results = []


for _, row in df.iterrows():


    T_hot_in = row["T_prod"] + 273.15
    mdot_w = row["m_dot_w"]


    # descartar temperaturas bajas
    if row["T_prod"] <= 45:
        results.append([
            row["Campo"],
            0,0,0,0,0
        ])
        continue


    Tevap = T_hot_in - pinch


    # presión evaporador
    P_high = CP.PropsSI(
        "P",
        "T",
        Tevap,
        "Q",
        1,
        fluid
    )


    h1 = CP.PropsSI(
        "H",
        "T",
        Tcond - subcooling,
        "P",
        P_low,
        fluid
    )


    s1 = CP.PropsSI(
        "S",
        "T",
        Tcond - subcooling,
        "P",
        P_low,
        fluid
    )


    
    h2s = CP.PropsSI(
        "H",
        "P",
        P_high,
        "S",
        s1,
        fluid
    )


    h2 = h1 + (h2s - h1)/eta_pump


    # -----------------------------
    # salida evaporador
    # -----------------------------
    h3 = CP.PropsSI(
        "H",
        "T",
        Tevap + superheat,
        "P",
        P_high,
        fluid
    )


    s3 = CP.PropsSI(
        "S",
        "T",
        Tevap + superheat,
        "P",
        P_high,
        fluid
    )


    h4s = CP.PropsSI(
        "H",
        "P",
        P_low,
        "S",
        s3,
        fluid
    )


    h4 = h3 - eta_turb*(h3 - h4s)


    


    T_hot_out = max(
        row["T_prod"] - 15,
        35
    ) + 273.15


    Q_hot = (
        mdot_w *
        cp_w *
        (T_hot_in - T_hot_out)
    )




    mdot_orc = Q_hot / (h3 - h2)




    W_turb = mdot_orc * (h3 - h4)
    W_pump = mdot_orc * (h2 - h1)


    W_net = W_turb - W_pump


    eta_th = W_net / Q_hot


    # LMTD EVAPORADOR


    DT1 = row["T_prod"] - (Tevap - 273.15)
    DT2 = (T_hot_out - 273.15) - (Tcond - 273.15)


    DT2 = max(DT2,1)


    LMTD = (
        DT1 - DT2
    ) / np.log(DT1/DT2)


    U = 850


    A_evap = Q_hot / (U*LMTD)


    results.append([
        row["Campo"],
        mdot_orc,
        Q_hot/1000,
        W_net/1000,
        eta_th*100,
        A_evap
    ])




# ========================================
# TABLA FINAL DE RESULTADOS
# ========================================


res = pd.DataFrame(
    results,
    columns=[
        "Campo",
        "m_dot_ORC_kg_s",
        "Q_in_kW",
        "W_net_kW",
        "eta_th_percent",
        "Area_evap_m2"
    ]
)


# Potencia eléctrica generada
res["Potencia_generada_kW"] = res["W_net_kW"]


# conversión a MW
res["Potencia_generada_MW"] = (
    res["Potencia_generada_kW"] / 1000
)


# reorganizar columnas
res = res[
    [
        "Campo",
        "m_dot_ORC_kg_s",
        "Q_in_kW",
        "Potencia_generada_kW",
        "Potencia_generada_MW",
        "eta_th_percent",
        "Area_evap_m2"
    ]
]


# redondeo
res = res.round(3)


print(res)


# exportar a excel
res.to_excel(
    "Resultados_ORC_R245fa.xlsx",
    index=False
)
