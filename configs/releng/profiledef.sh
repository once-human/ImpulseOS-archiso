#!/usr/bin/env bash
# shellcheck disable=SC2034

# Basic ISO Information
iso_name="impulseos"
iso_label="IMPULSE_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Impulse OS <https://impulse.matviran.com>"
iso_application="Impulse OS Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="impulseos"

# Build and Boot Modes
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp'
           'uefi-ia32.systemd-boot.eltorito' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"

# Pacman Configuration
pacman_conf="pacman.conf"

# Airootfs Image Configuration
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')

# Bootstrap Tarball Compression
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')

# File Permissions
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)

# Scripts to run once
run_once=('install-illogical-impulse.sh' 'lazyvim.sh' 'pre-installation.sh' 'post_install.sh')

# Run the scripts
for script in "${run_once[@]}"; do
  /usr/local/bin/$script
done
