#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=texinfo-6.8.tar.xz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && make TEXMF=/usr/share/texmf install-tex \
 && cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"