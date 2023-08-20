#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf nano-7.2 \
 && tar xf nano-7.2.tar.xz \
 && cd nano-7.2 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf nano-7.2 \
 && echo "done nano"