#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=e2fsprogs-1.46.5.tar.gz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && mkdir -v build \
 && cd build \
 && ../configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-elf-shlibs \
    --disable-libblkid \
    --disable-libuuid \
    --disable-uuidd \
    --disable-fsck \
 && make \
 && make install \
 && rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a \
 && gunzip -v /usr/share/info/libext2fs.info.gz \
 && install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info \
 && makeinfo -o doc/com_err.info ../lib/et/com_err.texinfo \
 && install -v -m644 doc/com_err.info /usr/share/info \
 && install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info \
 && cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"