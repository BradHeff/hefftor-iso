#!/bin/bash
echo "#################################"
echo "Start hefftorlinux-before.sh"
echo "#################################"

pacman-key --init
pacman-key --populate archlinux

mkdir -p /boot/grub/themes
cp -Rf /usr/share/grub/themes/Vimix /boot/grub/themes/

mv /etc/mkinitcpio.d/hefftorlinux /etc/mkinitcpio.d/linux.preset
rm /usr/local/bin/hefftorlinux-before.sh
