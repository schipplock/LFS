#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gzip-1.12 \
 && tar xf gzip-1.12.tar.xz \
 && cd gzip-1.12\
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf gzip-1.12 \
 && echo "done gzip"