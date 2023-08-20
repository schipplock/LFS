#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf grep-3.7 \
 && tar xf grep-3.7.tar.xz \
 && cd grep-3.7 \
 && ./configure --prefix=/usr \
    --host=$LFS_TGT \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf grep-3.7