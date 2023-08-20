#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf file-5.42 \
 && tar xf file-5.42.tar.gz \
 && cd file-5.42 \
 && mkdir build \
 && pushd build \
 && ../configure --disable-bzlib \
    --disable-libseccomp \
    --disable-xzlib \
    --disable-zlib \
 && make \
 && popd \
 && ./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess) \
 && make FILE_COMPILE=$(pwd)/build/src/file \
 && make DESTDIR=$LFS install \
 && rm -v $LFS/usr/lib/libmagic.la \
 && cd .. \
 && rm -rf file-5.42