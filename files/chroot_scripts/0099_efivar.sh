#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf efivar-38 \
 && tar xf efivar-38.tar.bz2 \
 && cd efivar-38 \
 && sed '/prep :/a\\ttouch prep' -i src/Makefile \
 && make \
 && make install LIBDIR=/usr/lib \
 && cd .. \
 && rm -rf efivar-38 \
 && echo "done efivar"