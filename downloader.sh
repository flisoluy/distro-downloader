#!/bin/bash

# Downloads each distro
#--------------------------------

OUTDIR=./distros

mkdir -p $OUTDIR

cd $OUTDIR

# High-demand distros
wget -c https://download.manjaro.org/kde/24.2.1/manjaro-kde-24.2.1-241216-linux612.iso
wget -c https://download.manjaro.org/gnome/24.2.1/manjaro-gnome-24.2.1-241216-linux612.iso
wget -c https://mirrors.cicku.me/linuxmint/iso/stable/22.1/linuxmint-22.1-cinnamon-64bit.iso
wget -c https://mirrors.cicku.me/linuxmint/iso/stable/22.1/linuxmint-22.1-mate-64bit.iso
wget -c https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Current.iso
wget -c https://download.opensuse.org/distribution/leap/15.6/iso/openSUSE-Leap-15.6-DVD-x86_64-Media.iso
wget -c https://download.fedoraproject.org/pub/fedora/linux/releases/41/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-41-1.4.iso
wget -c https://download.fedoraproject.org/pub/fedora/linux/releases/41/Spins/x86_64/iso/Fedora-KDE-Live-x86_64-41-1.4.iso
wget -c https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-12.9.0-amd64-DVD-1.iso
wget -c https://cdimage.ubuntu.com/kubuntu/releases/24.10/release/kubuntu-24.10-desktop-amd64.iso
wget -c https://files.kde.org/neon/images/user/20250202-0745/neon-user-20250202-0745.iso
wget -c https://releases.ubuntu.com/24.04.2/ubuntu-24.04.2-desktop-amd64.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.9.0-amd64-gnome.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.9.0-amd64-kde.iso

# Medium end distros
wget -c https://download.manjaro.org/xfce/24.2.1/manjaro-xfce-24.2.1-241216-linux612.iso
wget -c https://mirrors.cicku.me/linuxmint/iso/stable/22.1/linuxmint-22.1-xfce-64bit.iso
wget -c https://mirrors.ocf.berkeley.edu/trisquel-images//trisquel_11.0.1_amd64.iso

# Low end distros
wget -c https://tenet.dl.sourceforge.net/project/mx-linux/Snapshots/MX-23.5_February_x64.iso?viasf=1
wget -c https://tenet.dl.sourceforge.net/project/antix-linux/Final/antiX-23.2/antiX-23.2_x64-full.iso?viasf=1
wget -c https://cdimage.ubuntu.com/lubuntu/releases/24.10/release/lubuntu-24.10-desktop-amd64.iso
wget -c https://mirror.aarnet.edu.au/pub/xubuntu/releases/24.04/release/xubuntu-24.04.2-desktop-amd64.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.9.0-amd64-standard.iso
wget -c https://mirror.leaseweb.com/devuan/devuan_ascii/minimal-live/devuan_ascii_2.1_amd64_minimal-live.iso
wget -c https://mirror.leaseweb.com/devuan/devuan_ascii/minimal-live/devuan_ascii_2.1_i386_minimal-live.iso

cd ..

echo "Downloading done!"