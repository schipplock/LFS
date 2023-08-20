#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf libpipeline-1.5.6 \
 && tar xf libpipeline-1.5.6.tar.gz \
 && cd libpipeline-1.5.6 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf libpipeline-1.5.6 \
 && echo "done libpipeline"