#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf acl-2.3.1 \
 && tar xf acl-2.3.1.tar.xz \
 && cd acl-2.3.1 \
 && ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/acl-2.3.1 \
 && make \
 && make install \
 && cd .. \
 && rm -rf acl-2.3.1 \
 && echo "done acl"