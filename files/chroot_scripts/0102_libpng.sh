#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf libpng-1.6.39 \
 && tar xf libpng-1.6.39.tar.xz \
 && cd libpng-1.6.39 \
 && ./configure --prefix=/usr --disable-static \
 && make \
 && make install \
 && cd .. \
 && rm -rf libpng-1.6.39 \
 && echo "done libpng"