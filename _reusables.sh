#!/bin/bash
set +x
export LFS=/mnt/lfs
export MAKEFLAGS='-j4'
export NINJAJOBS=4
TARGET_DEVICE="/dev/nvme1n1"

function require-root-user {
  if [ "$EUID" -ne 0 ]; then
    printf "Please run as root\n"
    exit 1
  fi
}
