#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf patch-2.7.6\
 && tar xf patch-2.7.6.tar.xz \
 && cd patch-2.7.6 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf patch-2.7.6 \
 && echo "done patch"