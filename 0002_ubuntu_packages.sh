#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

# Dieses Skript installiert alle notwendigen Pakete für Ubuntu 22.04 LTS.

require-root-user

rm /bin/sh \
  && ln -s /bin/bash /bin/sh

apt update \
 && apt install -y \
    build-essential \
    bison \
    gawk \
    texinfo \
    parted

apt autoremove -y

echo "done installing ubuntu packages"