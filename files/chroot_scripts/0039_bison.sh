#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf bison-3.8.2 \
 && tar xf bison-3.8.2.tar.xz \
 && cd bison-3.8.2 \
 && ./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2 \
 && make \
 && make install \
 && cd .. \
 && rm -rf bison-3.8.2 \
 && echo "done bison"