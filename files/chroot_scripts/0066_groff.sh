#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf groff-1.22.4 \
 && tar xf groff-1.22.4.tar.gz \
 && cd groff-1.22.4 \
 && PAGE=A4 ./configure --prefix=/usr \
 && make -j1 \
 && make install \
 && cd .. \
 && rm -rf groff-1.22.4 \
 && echo "done groff"