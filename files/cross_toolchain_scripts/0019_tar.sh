#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf tar-1.34 \
 && tar xf tar-1.34.tar.xz \
 && cd tar-1.34 \
 && ./configure --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess) \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf tar-1.34