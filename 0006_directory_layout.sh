#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

mkdir -pv ${LFS}/{etc,var} ${LFS}/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/${i} ${LFS}/${i}
done

case $(uname -m) in
  x86_64) mkdir -pv ${LFS}/lib64 ;;
esac

mkdir -pv ${LFS}/tools

echo "done creating directories"