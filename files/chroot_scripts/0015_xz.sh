#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf xz-5.2.6 \
 && tar xf xz-5.2.6.tar.xz \
 && cd xz-5.2.6 \
 && ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/xz-5.2.6 \
 && make \
 && make check \
 && make install \
 && cd .. \
 && rm -rf xz-5.2.6 \
 && echo "done xz"