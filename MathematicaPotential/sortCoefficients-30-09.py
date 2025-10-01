import pandas as pd
from pandarallel import pandarallel
pandarallel.initialize(progress_bar=True)

columns = ["fourierType", "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9", "v10", "v11", "v12"]

df = pd.read_csv("coeffMultiMode3.dat", names=columns, delim_whitespace=True)

# df = df[df["v1"] == 0]
# df = df[df["v2"] == 0]

# df = df[df["v3"] > 0]
# df = df[df["v4"] > 0]
# df = df[df["v5"] == 0]

# df = df[df["v6"] == 0]

# df = df[df["v7"] == 0]
# df = df[df["v8"] == 0]
# df = df[df["v9"] == 0]

# df = df[df["v10"] == 0]
# df = df[df["v11"] == 0]

# df = df[df["v12"] > 0]
df = df[df["v12"] <= 3]

def multiModeSort(row, rank=3):
    multiMode = 0
    for i in range(1, 10):
        if row[f"v{i}"] > 0:
            multiMode += 1
    if row["v10"] > 0:
        multiMode += 1
    else:
        if row["v11"] > 0:
            multiMode += 1
    if abs(row["v12"]) > 1:
        multiMode += 1
    row["multiMode"] = multiMode
    return row

def convertTorsion(row):
    row["keep"] = True
    if row["fourierType"] == "h":
        row["v12"] = -row["v12"]
        if row["v12"] == 0:
            row["keep"] = False
    return row

df = df.parallel_apply(lambda x: multiModeSort(x), axis=1, result_type="expand")
print(df.head(20).to_string(header=False, index=False))
df = df[df["multiMode"] == 3]
print("\n")
print(df.head(20).to_string(header=False, index=False))
df = df.drop(["multiMode"], axis=1)
df = df.parallel_apply(lambda x: convertTorsion(x), axis=1, result_type="expand")
df = df[df["keep"] == True]
df = df.drop(["keep"], axis=1)
df = df.to_string(index=False, header=False)
statesFile = "CollectedCoefficients-MultiMode3.dat"
with open(statesFile, "w+") as FileToWriteTo:
    FileToWriteTo.write(df)
