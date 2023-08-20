#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf gzip-1.12 \
 && tar xf gzip-1.12.tar.xz \
 && cd gzip-1.12 \
 && ./configure --prefix=/usr --host=$LFS_TGT \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf gzip-1.12