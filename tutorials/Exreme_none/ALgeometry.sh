#!/bin/bash
# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions

rm -rf turbineGeometry
rm log.foamListTimes
runApplication foamListTimes

region='turbine'
components=('blade1.element' 'blade2.element' 'blade3.element' )  #'tower'

python3 scripts/ALgeometry.py $region "${components[@]}"
