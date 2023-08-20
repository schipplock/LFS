#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf popt-1.19 \
 && tar xf popt-1.19.tar.gz \
 && cd popt-1.19 \
 && ./configure --prefix=/usr --disable-static \
 && make \
 && make install \
 && cd .. \
 && rm -rf popt-1.19 \
 && echo "done popt"