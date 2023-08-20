#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf patch-2.7.6 \
 && tar xf patch-2.7.6.tar.xz \
 && cd patch-2.7.6 \
 && ./configure --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess) \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf patch-2.7.6