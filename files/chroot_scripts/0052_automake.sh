#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf automake-1.16.5 \
 && tar xf automake-1.16.5.tar.xz \
 && cd automake-1.16.5 \
 && ./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5 \
 && make \
 && make install \
 && cd .. \
 && rm -rf automake-1.16.5 \
 && echo "done automake"