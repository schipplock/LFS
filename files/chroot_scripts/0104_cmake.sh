#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf cmake-3.25.2 \
 && tar xf cmake-3.25.2.tar.gz \
 && cd cmake-3.25.2 \
 && sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake \
 && ./bootstrap --prefix=/usr --mandir=/share/man --no-system-jsoncpp --no-system-librhash --docdir=/share/doc/cmake-3.25.2 \
 && make \
 && make install \
 && cd .. \
 && rm -rf cmake-3.25.2 \
 && echo "done cmake"