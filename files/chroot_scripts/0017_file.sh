#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf file-5.42 \
 && tar xf file-5.42.tar.gz \
 && cd file-5.42 \
 && ./configure --prefix=/usr \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf file-5.42 \
 && echo "done file"