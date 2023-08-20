#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf libtool-2.4.7 \
 && tar -xf libtool-2.4.7.tar.xz \
 && cd libtool-2.4.7 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf libtool-2.4.7 \
 && rm -fv /usr/lib/libltdl.a \
 && echo "done libtool"