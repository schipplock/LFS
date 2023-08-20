#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf wheel-0.37.1 \
 && tar xf wheel-0.37.1.tar.gz \
 && cd wheel-0.37.1 \
 && pip3 install --no-index $PWD \
 && cd .. \
 && rm -rf wheel-0.37.1 \
 && echo "done wheel"