#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf libffi-3.4.2 \
 && tar xf libffi-3.4.2.tar.gz \
 && cd libffi-3.4.2 \
 && ./configure --prefix=/usr \
    --disable-static \
    --with-gcc-arch=native \
    --disable-exec-static-tramp \
 && make \
 && make install \
 && cd .. \
 && rm -rf libffi-3.4.2 \
 && echo "done libffi"