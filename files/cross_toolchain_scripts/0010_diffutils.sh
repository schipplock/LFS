#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf diffutils-3.8 \
 && tar xf diffutils-3.8.tar.xz \
 && cd diffutils-3.8 \
 && ./configure --prefix=/usr --host=$LFS_TGT \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf diffutils-3.8