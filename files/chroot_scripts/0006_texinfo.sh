#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf texinfo-6.8 \
 && tar xf texinfo-6.8.tar.xz \
 && cd texinfo-6.8 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf texinfo-6.8 \
 && echo "done texinfo"