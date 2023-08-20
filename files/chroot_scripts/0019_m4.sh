#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf m4-1.4.19 \
 && tar xf m4-1.4.19.tar.xz \
 && cd m4-1.4.19 \
 && ./configure --prefix=/usr \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf m4-1.4.19 \
 && echo "done m4"