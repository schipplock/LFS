#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf zlib-1.2.12 \
 && tar xf zlib-1.2.12.tar.gz \
 && cd zlib-1.2.12 \
 && ./configure --prefix=/usr \
 && make \
 && make check \
 && make install \
 && rm -fv /usr/lib/libz.a \
 && cd .. \
 && rm -rf zlib-1.2.12 \
 && echo "done zlib"