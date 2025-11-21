#!/bin/bash
# Mooring visualization

cd Mooring/
rm -r mooringVTK
cp -r ../Mooring/Line* ../Mooring/Mooring_

if true;
then
sed -i "$ d" Line1.out
sed -i "$ d" Line2.out
sed -i "$ d" Line3.out
sed -i "$ d" Line4.out
sed -i "$ d" Line5.out
sed -i "$ d" Line6.out
sed -i "$ d" Line7.out
fi


python3 ../scripts/postMoorDyn_VTK.py
