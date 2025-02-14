#!/bin/csh
#

cd $TMPDIR

module load intel-oneapi/2022.1.2

set point = $1
set endPoint = $2
echo $point 
while ($point < $endPoint)
    set line = `awk 'NR=='"$point" /scratch/dp060/dc-smol1/CH3OH/GridOfGeometries/CH3OH_FullGrid.txt`

    if ("$line" != "") then
        csh -f /scratch/dp060/dc-smol1/CH3OH/MainIso/AbInitio/SR-Corrections/CFOUR-SR-CH3OH.csh $line
    endif
@ point++
end
