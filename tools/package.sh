#!/bin/bash

set -e
set -x

INPUT=${1}
OUTPUT=${2}

tar -czvf /tmp/application.tar.gz -C ${INPUT}/root ./
cp ${INPUT}/cloud-init.sh.in ${OUTPUT}
cat /tmp/application.tar.gz | base64 >> ${OUTPUT}
