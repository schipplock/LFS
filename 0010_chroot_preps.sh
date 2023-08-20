#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
chown -R root:root $LFS/lib64

# prepare virtual kernel file systems
mkdir -pv $LFS/{dev,proc,sys,run}

# bind mount /dev , so it's available inside the chroot
mount -v --bind /dev $LFS/dev

# mount other virtual kernel file systems
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi