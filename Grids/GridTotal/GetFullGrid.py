import pandas as pd
from pandarallel import pandarallel
pandarallel.initialize(progress_bar=True)
# from decimal import Decimal, getcontext

# getcontext().prec = 20
equilibriumEnergy = -115.61161193

columns = ["rCO", "rOH", "rCH1", "rCH2", "rCH3", "aHOC","aOCH1", "aOCH2", "raOCH3", "dH1", "dH2", "dH3", "E", "point"]
# df = pd.read_csv("CH3OH-3DEnergies.dat", delim_whitespace=True, names=columns, dtype=str)
df1D = pd.read_csv("/scratch/vol1/asmola/Methanol/FitPesMEP/Grid1D/CH3OH-1D-C3V-Original.energies", delim_whitespace=True, names=columns, dtype=str)
df2D = pd.read_csv("/scratch/vol1/asmola/Methanol/FitPesMEP/Grid2D/CH3OH-2D-C3V.energies", delim_whitespace=True, names=columns, dtype=str)
df3D = pd.read_csv("/scratch/vol1/asmola/Methanol/FitPesMEP/Grid3D/CH3OH-3D-C3V.energies", delim_whitespace=True, names=columns, dtype=str)
dfMonteCarlo = pd.read_csv("/scratch/vol1/asmola/Methanol/FitPesMEP/GridMonteCarlo/CH3OH-MonteCarlo-C3V.energies", delim_whitespace=True, names=columns, dtype=str)

gridUpTo2D = pd.concat([df1D, df2D])
gridUpTo2D["Energy"] = (gridUpTo2D["E"].astype(float) - -115.61161193)*219474.63

gridUpTo2D = gridUpTo2D[gridUpTo2D["Energy"] < 40000]

gridUpTo6D = pd.concat([df3D, dfMonteCarlo])
gridUpTo6D["Energy"] = (gridUpTo6D["E"].astype(float) - -115.61161193)*219474.63

gridUpTo6D = gridUpTo6D[gridUpTo6D["Energy"] < 30000]

grid = pd.concat([gridUpTo2D, gridUpTo6D])
grid = grid.drop("Energy", axis=1)
grid = grid[grid["E"].duplicated() == False]


# df["point"] = df["point"].astype(int)
# def splitPoint(row):
#     row["point"] = row["point"].split(".")[0]
#     return row
# df = df.parallel_apply(lambda x: splitPoint(x), axis=1, result_type="expand")
grid = grid[["point", "rCO", "rOH", "rCH1", "rCH2", "rCH3", "aHOC","aOCH1", "aOCH2", "raOCH3", "dH1", "dH2", "dH3", "E"]]
# df["point"] = df["point"].astype(int)
# df = df.sort_values(by="point")
grid = grid.to_string(index=False, header=False)
statesFile = "CH3OH-FullGrid.dat"
with open(statesFile, "w+") as FileToWriteTo:
    FileToWriteTo.write(grid)
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