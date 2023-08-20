#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64 \
 && ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3 \
 && rm -rf glibc-2.36 \
 && tar xf glibc-2.36.tar.xz \
 && cd glibc-2.36 \
 && patch -Np1 -i ../glibc-2.36-fhs-1.patch \
 && mkdir -v build \
 && cd build \
 && echo "rootsbindir=/usr/sbin" > configparms \
 && ../configure \
      --prefix=/usr \
      --host=$LFS_TGT \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2 \
      --with-headers=$LFS/usr/include \
        libc_cv_slibdir=/usr/lib \
 && make \
 && make DESTDIR=$LFS install \
 && sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd \
 && cd .. \
 && cd .. \
 && rm -rf glibc-2.36 \
 && echo 'int main(){}' | gcc -xc - \
 && readelf -l a.out | grep ld-linux \
 && rm -v a.out \
 && $LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders