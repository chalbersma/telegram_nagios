#!/bin/bash

# es_opt script. Python wrapper for es_opt.py

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


RUN_LOC="/opt/telegram_nagios"

pushd ${RUN_LOC} &> /dev/null

source ${RUN_LOC}/bin/activate

# Run passing the flags you gave me
${RUN_LOC}/telegram_nagios.py $@

deactivate

popd &> /dev/null

# Deactivate Environment For continued Setup

