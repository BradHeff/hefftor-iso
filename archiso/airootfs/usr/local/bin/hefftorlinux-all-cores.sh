#!/bin/bash
#set -e
cores=$(grep -c ^processor /proc/cpuinfo)

if [ $cores -gt 1 ]
then
        sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j'$(($cores+1))'"/g' /etc/makepkg.conf;
        sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z - --threads=0)/g' /etc/makepkg.conf
        sudo sed -i 's/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q - --threads=0)/g' /etc/makepkg.conf
        sudo sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/g" /etc/makepkg.conf
fi
