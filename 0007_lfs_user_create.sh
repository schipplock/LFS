#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
cp ${SCRIPT_DIR}/files/bash_profile /home/lfs/.bash_profile
cp ${SCRIPT_DIR}/files/bashrc /home/lfs/.bashrc
mkdir -p /home/lfs/scripts
cp ${SCRIPT_DIR}/_reusables.sh /home/lfs/scripts/
cp ${SCRIPT_DIR}/0008_lfs_user_test.sh /home/lfs/scripts/
chown -vR lfs:lfs /home/lfs

chown -v lfs ${LFS}/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs ${LFS}/lib64 ;;
esac

echo "done creating lfs user"