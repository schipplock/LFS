#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf grep-3.7 \
 && tar xf grep-3.7.tar.xz \
 && cd grep-3.7 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf grep-3.7 \
 && echo "done grep"