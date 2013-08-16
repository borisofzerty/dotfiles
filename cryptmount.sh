#!/bin/bash

# mount the encrypted partition and run
if ! [ -d /mnt/encr/PONIES/ ]; then
    sudo cryptsetup luksOpen /dev/sda1 crypto
    sudo mount /dev/mapper/crypto /mnt/encr
    sudo cryptsetup -v status crypto
else
    echo "encrypted partition already mounted"
fi

# run rtorrent
if [ $(ps -ef | grep rtorrent | wc -l) -eq 1 ]; then
    cd
    # start rtorrent using the old .rc
    sudo su -c 'rtorrent -O import=/home/rt/.rtorrent.rc' rt
else
    echo "rtorrent already running"
fi
