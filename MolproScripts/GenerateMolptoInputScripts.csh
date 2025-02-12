#!/bin/csh
#
# Generation of the input file for MOLPRO
#

set pwd = `pwd`

set point = $1        
    
cat<<endb> $fname.inp
***, Methanol Ground State Energy with CCSD(T)-F12 and cc-pVTZ-F12
memory,500,m;

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

! Use the cc-pVTZ-F12 basis set
basis=cc-pVTZ-F12

hf

! Use explicitly correlated F12 methods
! First, MP2-F12 (useful for initial electronic energy)
{mp2-f12}

! If desired, perform CCSD(T)-F12 for more accurate results
{ccsd(t)-f12}

! Output the energy

--- End of Script ---
endb

./j-trove_2004b.x <$fname.inp > $fname.out

