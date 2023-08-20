#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf harfbuzz-7.0.0 \
 && tar xf harfbuzz-7.0.0.tar.xz \
 && cd harfbuzz-7.0.0 \
 && mkdir build \
 && cd build \
 && meson --prefix=/usr --buildtype=release -Dgraphite2=enabled \
 && ninja \
 && ninja install \
 && cd .. \
 && rm -rf harfbuzz-7.0.0 \
 && echo "done harfbuzz"