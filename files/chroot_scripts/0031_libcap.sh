#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf libcap-2.65 \
 && tar xf libcap-2.65.tar.xz \
 && cd libcap-2.65 \
 && sed -i '/install -m.*STA/d' libcap/Makefile \
 && make prefix=/usr lib=lib \
 && make test \
 && make prefix=/usr lib=lib install \
 && cd .. \
 && rm -rf libcap-2.65 \
 && echo "done libcap"