#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

# Dieses Skript baut die Toolchain.

date

touch ${LFS}/sources/build.log
> ${LFS}/sources/build.log

mkdir -p /home/lfs/cross_toolchain_scripts
cp ${SCRIPT_DIR}/files/cross_toolchain_scripts/*.sh /home/lfs/cross_toolchain_scripts/
chown -R lfs:lfs /home/lfs

# build binutils
echo "cross-toolchain: building binutils"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0001_binutils.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building binutils"

# build gcc
echo "cross-toolchain: building gcc"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0002_gcc.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building gcc"

# prepare linux api headers
echo "cross-toolchain: building api headers"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0003_linux_api_headers.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building api headers"

# build glibc
echo "cross-toolchain: building glibc"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0004_glibc.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building glibc"

# build libstdc++
echo "cross-toolchain: building libstdc++"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0005_libstdcpp.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building libstdc++"

# build m4
echo "cross-toolchain: building m4"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0006_m4.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building m4"

# build ncurses
echo "cross-toolchain: building ncurses"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0007_ncurses.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building ncurses"

# build bash
echo "cross-toolchain: building bash"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0008_bash.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building bash"

# build coreutils
echo "cross-toolchain: building coreutils"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0009_coreutils.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building coreutils"

# build diffutils
echo "cross-toolchain: building diffutils"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0010_diffutils.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building diffutils"

# build file
echo "cross-toolchain: building file"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0011_file.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building file"

# build findutils
echo "cross-toolchain: building findutils"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0012_findutils.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building findutils"

# build gawk
echo "cross-toolchain: building gawk"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0013_gawk.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building gawk"

# build grep
echo "cross-toolchain: building grep"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0014_grep.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building grep"

# build gzip
echo "cross-toolchain: building gzip"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0015_gzip2.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building gzip"

# build make
echo "cross-toolchain: building make"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0016_make.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building make"

# build patch
echo "cross-toolchain: building patch"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0017_patch.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building patch"

# build sed
echo "cross-toolchain: building sed"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0018_sed.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building sed"

# build tar
echo "cross-toolchain: building tar"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0019_tar.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building tar"

# build xz
echo "cross-toolchain: building xz"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0020_xz.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building xz"

# build binutils
echo "cross-toolchain: building binutils"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0021_binutils.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building binutils"

# build gcc pass2
echo "cross-toolchain: building gcc pass2"
time runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i /home/lfs/cross_toolchain_scripts/0022_gcc_pass2.sh &>> ${LFS}/sources/build.log
echo "cross-toolchain: done building gcc pass2"

echo "done building cross toolchain"