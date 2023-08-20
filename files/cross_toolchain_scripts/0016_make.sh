#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf make-4.3 \
 && tar xf make-4.3.tar.gz \
 && cd make-4.3 \
 && ./configure --prefix=/usr \
    --without-guile \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess) \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf make-4.3