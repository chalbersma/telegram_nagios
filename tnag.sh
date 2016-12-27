#!/bin/bash

RUN_LOC="/opt/telegram_nagios"

pushd ${RUN_LOC} &> /dev/null

source ${RUN_LOC}/bin/activate

# Run passing the flags you gave me
${RUN_LOC}/telegram_nagios.py $@

deactivate

popd &> /dev/null

# Deactivate Environment For continued Setup

