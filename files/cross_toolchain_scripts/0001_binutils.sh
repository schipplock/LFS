#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources && rm -rf binutils-2.39 \
 && tar xf binutils-2.39.tar.xz \
 && cd binutils-2.39 \
 && mkdir -v build && cd build \
 && ../configure --prefix=$LFS/tools \
                 --with-sysroot=$LFS \
                 --target=$LFS_TGT \
                 --disable-nls \
                 --enable-gprofng=no \
                 --disable-werror \
 && make \
 && make install \
 && cd .. \
 && cd .. \
 && rm -rf binutils-2.39