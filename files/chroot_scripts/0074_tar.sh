#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf tar-1.34 \
 && tar xf tar-1.34.tar.xz \
 && cd tar-1.34 \
 && FORCE_UNSAFE_CONFIGURE=1 ./configure --prefix=/usr \
 && make \
 && make install \
 && make -C doc install-html docdir=/usr/share/doc/tar-1.34 \
 && cd .. \
 && rm -rf tar-1.34 \
 && echo "done tar"