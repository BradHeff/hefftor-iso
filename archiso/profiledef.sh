#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name=hefftorlinux
iso_label="hefftorlinux-v2021-03-12"
iso_publisher="HefftorLinux <https://www.hefftorlinux.net>"
iso_application="HefftorLinux Live/Rescue CD"
iso_version="v2021-03-12"
install_dir=arch
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
#airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
airootfs_image_tool_options=('-comp' 'xz')
file_permissions=(
  ["/etc/shadow"]="0:0:600"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/sudoers.d"]="0:0:750"
  ["/usr/local/bin/hefftorlinux-all-cores.sh"]="0:0:755"
  ["/usr/local/bin/hefftorlinux-before.sh"]="0:0:755"
  ["/usr/local/bin/hefftorlinux-final.sh"]="0:0:755"
)
