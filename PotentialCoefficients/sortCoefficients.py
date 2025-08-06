import numpy as np
import pandas as pd
from pandarallel import pandarallel
pandarallel.initialize(progress_bar=True)

columns1 = ["rCO", "rOH", "rCH1", "rCH2", "rCH3", "aHOC", "aOCH1","aOCH2", "aOCH3", "Sa", "Sb", "tau"]
columns2 = ["f", "rCO", "rOH", "rCH1", "rCH2", "rCH3", "aHOC", "aOCH1","aOCH2", "aOCH3", "Sa", "Sb", "tau"]

df1 = pd.read_csv("Coeff2DCBS.dat", delim_whitespace=True, names=columns1)
df2 = pd.read_csv("CoeffMultiMode3.dat", delim_whitespace=True, names=columns2)
df2 = df2[df2["tau"] <= 12]
def flipSign(row):
    if row["f"] == "h":
        row["tau"] *= -1
    return row

df2 = df2.parallel_apply(lambda x:flipSign(x), result_type="expand", axis=1)
# df2 = df2[columns1]
def createTag(row):
    row["tag"] = ""
    for column in columns1:
        row["tag"] += str(row[column]) + "_"
    row["tag"] = row["tag"][:-1]
    return row

df1 = df1.parallel_apply(lambda x:createTag(x), axis=1, result_type="expand")
df2 = df2.parallel_apply(lambda x:createTag(x), axis=1, result_type="expand")

def findExistingParameters(row, existingParameters):
    row["exists"] = False
    existingParameters = existingParameters[existingParameters["tag"] == row["tag"]]
    if len(existingParameters) == 1:
        row["exists"] = True
    return row

df2 = df2.parallel_apply(lambda x:findExistingParameters(x, df1), axis=1, result_type="expand")
df2 = df2[df2["exists"] ==  False]
print("\n")
print(df2.head(5).to_string(index=False))
df2 = df2[columns2]
df2 = df2.to_string(index=False)

coefficientsFile = "CH3OH-MultiMode3.coeffs"
with open(coefficientsFile, "w+") as FileToWriteTo:
    FileToWriteTo.write(df2)

