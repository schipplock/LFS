#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

# Dieses Skript läd alle notwendigen Dateien runter.
# Bereits heruntergeladene Dateien werden nicht erneut runtergeladen.
# Das Skript validiert zusätzlich die md5-Prüfsummen.

mkdir -p ${SCRIPT_DIR}/downloads
wget --input-file=${SCRIPT_DIR}/wget-list --continue -nc --directory-prefix=${SCRIPT_DIR}/downloads

pushd ${SCRIPT_DIR}/downloads
  md5sum -c ${SCRIPT_DIR}/md5sums
popd

echo "done downloading files"