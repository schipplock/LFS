#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

# Dieses Skript geht davon aus, dass LFS auf einer dedizierten Festplatte installiert wird.
# Dieses Skript löscht deswegen auch alle Partitionen auf der Festplatte ${TARGET_DEVICE}.
# Auch die Partitionstabelle wird komplett entfernt.
# ${TARGET_DEVICE} ist in "_reusables.sh" definiert.
# Das Skript erzeugt eine komplett neue Partitionstabelle und neue Partitionen.

require-root-user

DELAY_SECONDS=30

partition_count=$(($(parted -sm ${TARGET_DEVICE} print | wc -l) - 2))

if ((${partition_count} == 0)); then
  printf "no partitions found on %s\n" ${TARGET_DEVICE}
else
  # Show a warning
  for ((seconds = ${DELAY_SECONDS}; seconds > 0; seconds--)); do
    for ((partition = 1 ; partition <= ${partition_count} ; partition++)); do
      printf "\rWARNING! Going to DELETE %d partitions on %s in %d seconds (press ctrl+c to prevent this)..." \
        ${partition_count} ${TARGET_DEVICE} ${seconds}
    done
    sleep 1
  done
  printf "\n----\n"
  wipefs -a ${TARGET_DEVICE}
fi

# prepare the disklabel and partitions
parted -s -- ${TARGET_DEVICE} "mklabel GPT" \
  "mkpart \"EFI system partition\" fat32 1MiB 301MiB" \
  "set 1 esp on" \
  "mkpart \"swap partition\" linux-swap 301MiB 8493MiB" \
  "mkpart \"root partition\" ext4 8493MiB 100%"

# create the filesystem(s)
mkfs.fat -F 32 ${TARGET_DEVICE}p1
mkswap ${TARGET_DEVICE}p2
yes | mkfs -v -t ext4 ${TARGET_DEVICE}p3

echo "done setting up partitions for ${TARGET_DEVICE}"