#!/bin/csh
#
# Generation of the input file for MOLPRO
#

setenv PATH /home/dc-smol1/.local/cfour/bin:$PATH

set pwd = `pwd`

set point = $1        
set directory = /scratch/dp060/dc-smol1/CH3OH/MainIso/AbInitio/SR-Corrections
set fname = cfour_CH3OH_SR_AUG-PCVTZ_${point}

cat<<endb> ZMAT
Methanol SR MVD1 calculation                                            
C
O 1 rco 
H 2 roh 1 acoh
H 1 rch1 2 aoch1 3 ahh1
H 1 rch2 2 aoch2 3 ahh2
H 1 rch3 2 aoch3 3 ahh3                                                                 
                                                                                
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
                                                                                
                                                                                
*CFOUR(CALC=CCSD(T),BASIS=AUG-PCVTZ,SCF_CONV=10                                     
CC_CONV=10,RELATIVISTIC=MVD1,MEMORY=5000000000)
endb

/home/dc-smol1/.local/cfour/bin/xcfour > ${fname}.out
rm ZMAT
cp ${fname}.out ${directory}
/home/dc-smol1/.local/cfour/bin/xclean
