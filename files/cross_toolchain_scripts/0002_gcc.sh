#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf mpfr-4.1.0 \
 && rm -rf gmp-6.2.1 \
 && rm -rf mpc-1.2.1 \
 && rm -rf gcc-12.2.0 \
 && tar xf mpfr-4.1.0.tar.xz \
 && tar xf gmp-6.2.1.tar.xz \
 && tar xf mpc-1.2.1.tar.gz \
 && tar xf gcc-12.2.0.tar.xz \
 && mv -v mpfr-4.1.0 gcc-12.2.0/mpfr \
 && mv -v gmp-6.2.1 gcc-12.2.0/gmp \
 && mv -v mpc-1.2.1 gcc-12.2.0/mpc \
 && cd gcc-12.2.0 \
 && sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64 \
 && mkdir -v build \
 && cd build \
 && ../configure \
      --target=$LFS_TGT \
      --prefix=$LFS/tools \
      --with-glibc-version=2.36 \
      --with-sysroot=$LFS \
      --with-newlib \
      --without-headers \
      --disable-nls \
      --disable-shared \
      --disable-multilib \
      --disable-decimal-float \
      --disable-threads \
      --disable-libatomic \
      --disable-libgomp \
      --disable-libquadmath \
      --disable-libssp \
      --disable-libvtv \
      --disable-libstdcxx \
      --enable-languages=c,c++ \
 && make \
 && make install \
 && cd .. \
 && cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
    `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h \
 && cd .. \
 && rm -rf gcc-12.2.0 \
 && rm -rf mpc-1.2.1 \
 && rm -rf gmp-6.2.1 \
 && rm -rf mpfr-4.1.0