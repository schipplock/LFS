#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf mpc-1.2.1 \
 && tar xf mpc-1.2.1.tar.gz \
 && cd mpc-1.2.1 \
 && ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/mpc-1.2.1 \
 && make \
 && make html \
 && make check \
 && make install \
 && make install-html \
 && cd .. \
 && rm -rf mpc-1.2.1 \
 && echo "done mpc"