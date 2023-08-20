#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf Python-3.10.6 \
 && tar xf Python-3.10.6.tar.xz \
 && cd Python-3.10.6 \
 && ./configure --prefix=/usr \
    --enable-shared \
    --without-ensurepip \
 && make \
 && make install \
 && cd .. \
 && rm -rf Python-3.10.6 \
 && echo "done python"