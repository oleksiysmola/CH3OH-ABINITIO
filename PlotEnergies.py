import pandas as pd
from pandarallel import pandarallel
import matplotlib.pyplot as plt
pandarallel.initialize(progress_bar=True)

energies = pd.read_csv("1dTestRun.txt", delim_whitespace=True)
energies["tau"] = (energies["A1"] + energies["A2"] + energies["tbar"])/3
energies = energies.sort_values("tau")
print(energies.to_string(index=False))
energies = energies[energies["tau"] > 121]
# energies = energies.sort_values("E")
# energies = energies.head(len(energies) - 2)
# energies = energies.sort_values("tau")
energies = energies[["tau", "E"]]
newTau = [i*10 for i in range(0, 13)]
newTau.remove(100)
newE = [energies.iloc[-1]["E"]]
newE += energies["E"].to_list()
print(newTau)
print(newE)
newEnergies = pd.DataFrame({"tau": newTau, "E": newE})
energies = pd.concat([newEnergies, energies])
energies = energies[["tau", "E"]]
newTau = [i*10 for i in range(25, 37)]
newTau.remove(340)
newE = newE[1:len(newE)]
# newE += [energies.iloc[-1]["E"]]
print(newTau)
print(newE)
newEnergies = pd.DataFrame({"tau": newTau, "E": newE})
energies = pd.concat([energies, newEnergies])
print(energies.to_string(index=False))

energies["E"] = (energies["E"] - energies["E"].min())*219474.63 

scatterSize = 50
plt.figure()

plt.plot(energies["tau"], abs(energies["E"]), "b")
plt.scatter(energies["tau"], abs(energies["E"]), s=scatterSize, facecolors="none", edgecolors="blue")
# plt.plot(originalUncertainty, predictedUncertainty, "r-")
fontsize=30
plt.xticks(fontsize=fontsize)
plt.yticks(fontsize=fontsize)
# plt.plot(newVariationalCoeffGood["ivib"],  abs(newVariationalCoeffGood["CoYuTeErr15"])-abs(newVariationalCoeffGood["Err15-Err14"]), "b.", label=r"C$_i > 0.7$")
# plt.plot(newVariationalCoeffBad["ivib"],  abs(newVariationalCoeffBad["CoYuTeErr15"])-abs(newVariationalCoeffBad["Err15-Err14"]), "r.", label=r"C$_i \leq 0.7$")
# plt.legend(fontsize=fontsize*0.75)
# plt.yscale("log")
plt.xlabel(r"$\tau$", fontsize=fontsize)
plt.xlim(0, 360)
plt.ylim(0, 250)
plt.grid()
plt.ticklabel_format(useOffset=False)
# plt.ylabel(r"$|$obs-calc$|$, cm$^{-1}$", fontsize=fontsize)
plt.ylabel(r"E, cm$^{-1}$", fontsize=fontsize)
# plt.title(r"$i_{\text{vib}}=1$", fontsize=fontsize)
plt.show()