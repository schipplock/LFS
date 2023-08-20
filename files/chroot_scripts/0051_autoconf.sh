#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf autoconf-2.71 \
 && tar xf autoconf-2.71.tar.xz \
 && cd autoconf-2.71 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf autoconf-2.71 \
 && echo "done autoconf"