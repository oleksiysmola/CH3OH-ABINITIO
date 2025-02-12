import pandas as pd
from pandarallel import pandarallel
pandarallel.initialize(progress_bar=True)

columns = ["fourierType", "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9", "v10", "v11", "v12"]

df = pd.read_csv("coeffMultiMode3.dat", names=columns, delim_whitespace=True)

df = df[df["v1"] == 0]
df = df[df["v2"] == 0]

df = df[df["v3"] > 0]
df = df[df["v4"] > 0]
df = df[df["v5"] == 0]

df = df[df["v6"] == 0]

df = df[df["v7"] == 0]
df = df[df["v8"] == 0]
df = df[df["v9"] == 0]

df = df[df["v10"] == 0]
df = df[df["v11"] == 0]

df = df[df["v12"] > 0]
df = df[df["v12"] <= 9]

def convertTorsion(row):
    if row["fourierType"] == "h":
        row["v12"] = - row["v12"]
    return row

df = df.parallel_apply(lambda x: convertTorsion(x), axis=1, result_type="expand")
df = df.to_string(index=False, header=False)
statesFile = "CollectedCoefficientsHolder.dat"
with open(statesFile, "w+") as FileToWriteTo:
    FileToWriteTo.write(df)
