#!/bin/bash
# $1=#a (calling aet)  $2=#r (calling presentation address) $3=#p (path/studyiuid) $4=#f file name
FOLDER="/Volumes/Archive/DCM_IMATEC/CLASSIFIED/${4%%.*}@$1@$2/${3##*/}"
DT=`date +%s`
/bin/mkdir -p $FOLDER
/bin/mv $3/$4 $FOLDER/${4#*.}_$DT.dcm
