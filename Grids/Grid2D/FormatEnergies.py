import pandas as pd
from pandarallel import pandarallel
pandarallel.initialize(progress_bar=True)
# from decimal import Decimal, getcontext

# getcontext().prec = 20


columns = ["grep", "rCO", "rOH", "rCH1", "rCH2", "rCH3", "aHOC","aOCH1", "aOCH2", "raOCH3", "dH1", "dH2", "dH3", "E", "point"]
# df = pd.read_csv("CH3OH-3DEnergies.dat", delim_whitespace=True, names=columns, dtype=str)
df = pd.read_csv("CH3OH-2D-C3V.dat", delim_whitespace=True, names=columns, dtype=str)
# df["point"] = df["point"].astype(int)
def splitPoint(row):
    row["point"] = row["point"].split(".")[0]
    return row
df = df.parallel_apply(lambda x: splitPoint(x), axis=1, result_type="expand")
df = df[["rCO", "rOH", "rCH1", "rCH2", "rCH3", "aHOC","aOCH1", "aOCH2", "raOCH3", "dH1", "dH2", "dH3", "E", "point"]]
# df[["dH1", "dH2", "dH3"]] = (df[["dH1", "dH2", "dH3"]].astype(float) + 120.00)
df["point"] = df["point"].astype(int)
# displacements = df[["dH1", "dH2", "dH3"]]
# displacements["dH1"] = displacements["dH1"] - 180.0
# displacements["dH2"] = displacements["dH2"] - 300.0
# displacements["dH3"] = displacements["dH3"] - 420.0
# df["dH1"] = 180.0 + displacements["dH2"]
# df["dH2"] = 300.0 + displacements["dH3"]
# df["dH3"] = 60.0 + displacements["dH1"]
df = df.sort_values(by="point")
# df = df.to_string(index=False, header=False, formatters={'dH1': '{:.8f}'.format, 'dH2': '{:.8f}'.format, 'dH3': '{:.8f}'.format})
df = df.to_string(index=False, header=False)
statesFile = "CH3OH-2D-C3V.energies"
with open(statesFile, "w+") as FileToWriteTo:
    FileToWriteTo.write(df)
# re1= 1.4296
# re2= 0.95887
# re3= 1.092294
# re4= 1.092294
# re5= 1.092294
# ae1= 107.9812
# ae2= 110.6646
# ae3= 110.6646
# ae4= 110.6646
# rco   =re1+ s1
# rch0  =re2+ s2
# rch1  =re3+ s3
# rch2  =re4+ s4
# rch3  =re5+ s5
# acoh  =ae1+ s6
# aoch1 =ae2+ s7
# aoch2 =ae2+ s8
# aoch3 =ae2+ s9