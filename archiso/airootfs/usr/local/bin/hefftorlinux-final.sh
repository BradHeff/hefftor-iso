#!/bin/bash
echo "#################################"
echo "Start hefftorlinux-final.sh"
echo "#################################"

chmod 750 /etc/sudoers.d
chmod 750 /etc/polkit-1/rules.d
chgrp polkitd /etc/polkit-1/rules.d
chmod 600 /etc/gshadow
chmod 600 /etc/shadow
cp -aT /etc/skel/ /root/

rm -rf /etc/systemd/system/getty@tty1.service.d

echo "EDITOR=nano" >> /etc/profile
sed -i "s/#AutoEnable=false/AutoEnable=true/g" /etc/bluetooth/main.conf
echo 'load-module module-switch-on-connect' | sudo tee --append /etc/pulse/default.pa

rm -f /etc/sudoers.d/g_wheel
rm -rf /usr/share/backgrounds/xfce
rm -f /etc/sddm.conf.d/autologin.conf
rm -f /etc/polkit-1/rules.d/49-nopasswd_global.rules
rm -r /etc/systemd/system/etc-pacman.d-gnupg.mount
rm /root/{.automated_script.sh,.zlogin}
mv /etc/hefftorlinux-release /etc/lsb-release

chmod -v 750 /root

rm /usr/local/bin/hefftorlinux-all-cores.sh
rm /usr/local/bin/hefftorlinux-final.sh
sh /usr/local/bin/hefftorlinux-installs.sh >/dev/null
rm /usr/local/bin/hefftorlinux-installs.sh

