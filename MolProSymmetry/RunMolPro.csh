#!/bin/csh
#
# Generation of the input file for MOLPRO
#

set pwd = `pwd`

set point = $1        
set directory = /scratch/scratch/zcaposm/Methanol/MOLPRO/VQZ/1D/CH3OH_1D_MEP_AdaptiveGrid
set fname = CH3OH_1D_MEP_point_${point}

cat<<endb> ${fname}.inp
***, Methanol Ground State Energy with CCSD(T)-F12 and cc-pVQZ-F12
memory,500,m;
gthresh,energy=1.d-10,zero=1.d-14,thrint=1.d-14,oneint=1.d-14,twoint=1.d-14,prefac=1.d-20

geometry={angstrom
c 
o , 1, rco 
h , 2, roh, 1, acoh
h1, 1, rch1, 2, aoch1  3  ahh1
h2, 1, rch2, 2, aoch2, 3, ahh2
h3, 1, rch3, 2, aoch3, 3, ahh3
}

! Specify the initial values of the internal coordinates (in Angstroms and degrees)

rco= $2
roh= $3
rch1= $4
rch2= $5
rch3= $6
acoh= $7
aoch1= $8
aoch2= $9
aoch3= $10
ahh1=$11
ahh2=$12
ahh3=$13

! Use the cc-pVQZ-F12 basis set
basis=cc-pVQZ-F12

hf

! Use explicitly correlated F12 methods
! First, MP2-F12 (useful for initial electronic energy)
{mp2-f12}

! If desired, perform CCSD(T)-F12 for more accurate results
{ccsd(t)-f12}

! Output the energy
xxx = "mmm"
point = ${point}
text ### CH3OH
table,xxx,rco,roh,rch1,rch2,rch3,acoh,aoch1,aoch2,aoch3,ahh1,ahh2,ahh3,energy,point
DIGITS, 0, 8, 8, 8, 8, 8, 8, 8, 8, 8,  8,  8,  8, 8, 4
save,CH3OH_MEP_MP2_${point}.dat,new

--- End of Script ---
endb

module load molpro2022
molpro ${fname}.inp
rm ${fname}.inp
