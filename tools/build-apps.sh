#!/bin/bash

set -e
set -x

pushd /tmp
if [ ! -e sslscan ]
then
  git clone https://github.com/rbsec/sslscan.git
fi

pushd sslscan
docker build -t sslscan .
docker run \
  --rm \
  --entrypoint \
    /bin/ash \
  -v ${PWD}:/out \
  localhost/sslscan \
  /bin/ash \
    '-c "cp /sslscan /out"'
popd #sslscan
popd #tmp
