#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf graphite2-1.3.14 \
 && tar xf graphite2-1.3.14.tgz \
 && cd graphite2-1.3.14 \
 && sed -i '/cmptest/d' tests/CMakeLists.txt \
 && mkdir build \
 && cd    build \
 && cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
 && make \
 && make install \
 && cd .. \
 && rm -rf graphite2-1.3.14 \
 && echo "done graphite2"