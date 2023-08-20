#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf psmisc-23.5 \
 && tar xf psmisc-23.5.tar.xz \
 && cd psmisc-23.5 \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && cd .. \
 && rm -rf psmisc-23.5 \
 && echo "done psmisc"