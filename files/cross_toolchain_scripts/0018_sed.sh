#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf sed-4.8 \
 && tar xf sed-4.8.tar.xz \
 && cd sed-4.8 \
 && ./configure --prefix=/usr \
    --host=$LFS_TGT \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf sed-4.8