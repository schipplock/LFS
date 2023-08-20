#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf bc-6.0.1 \
 && tar xf bc-6.0.1.tar.xz \
 && cd bc-6.0.1 \
 && CC=gcc ./configure --prefix=/usr -G -O3 -r \
 && make \
 && make test \
 && make install \
 && cd .. \
 && rm -rf bc-6.0.1 \
 && echo "done bc"