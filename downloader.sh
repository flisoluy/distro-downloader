#!/bin/bash

# Downloads each distribution
#--------------------------------

OUTDIR=./distros

mkdir -p $OUTDIR

cd $OUTDIR

mkdir HighEnd
cd HighEnd

# High-demand distros
wget -c https://download.manjaro.org/kde/25.0.0/manjaro-kde-25.0.0-250414-linux612.iso
wget -c https://download.manjaro.org/gnome/25.0.0/manjaro-gnome-25.0.0-250414-linux612.iso
wget -c https://mirrors.cicku.me/linuxmint/iso/stable/22.1/linuxmint-22.1-cinnamon-64bit.iso
wget -c https://mirrors.cicku.me/linuxmint/iso/stable/22.1/linuxmint-22.1-mate-64bit.iso
wget -c https://download.opensuse.org/tumbleweed/iso/openSUSE-Tumbleweed-DVD-x86_64-Snapshot20250417-Media.iso
wget -c https://download.opensuse.org/distribution/leap/15.6/iso/openSUSE-Leap-15.6-DVD-x86_64-Build710.3-Media.iso
wget -c https://download.fedoraproject.org/pub/fedora/linux/releases/42/Workstation/x86_64/iso/Fedora-Workstation-Live-42-1.1.x86_64.iso
wget -c https://download.fedoraproject.org/pub/fedora/linux/releases/42/KDE/x86_64/iso/Fedora-KDE-Desktop-Live-42-1.1.x86_64.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.10.0-amd64-kde.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.10.0-amd64-gnome.iso
wget -c https://cdimage.ubuntu.com/kubuntu/releases/25.04/release/kubuntu-25.04-desktop-amd64.iso
wget -c https://files.kde.org/neon/images/user/20250417-1319/neon-user-20250417-1319.iso
wget -c https://releases.ubuntu.com/25.04/ubuntu-25.04-desktop-amd64.iso

cd ..
mkdir -p MediumEnd
cd MediumEnd

# Medium end distros
wget -c https://download.manjaro.org/xfce/25.0.0/manjaro-xfce-25.0.0-250414-linux612.iso
wget -c https://mirrors.cicku.me/linuxmint/iso/stable/22.1/linuxmint-22.1-xfce-64bit.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.10.0-amd64-xfce.iso
wget -c https://cdimage.trisquel.info/trisquel-images/trisquel_11.0.1_amd64.iso
wget -c https://cdimage.trisquel.info/trisquel-images/trisquel-mini_11.0.1_amd64.iso

cd ..
mkdir -p LowEnd
cd LowEnd

# Low end distros
wget -c https://cfhcable.dl.sourceforge.net/project/mx-linux/Final/Fluxbox/MX-23.6_fluxbox_386.iso
wget -c https://tenet.dl.sourceforge.net/project/mx-linux/Final/Xfce/MX-23.6_386.iso
wget -c https://tenet.dl.sourceforge.net/project/mx-linux/Final/Xfce/MX-23.6_x64.iso
wget -c https://cfhcable.dl.sourceforge.net/project/mx-linux/Final/Fluxbox/MX-23.6_fluxbox_x64.iso
wget -c https://tenet.dl.sourceforge.net/project/antix-linux/Final/antiX-23.2/runit-antiX-23.2/antiX-23.2-runit_386-full.iso
wget -c https://tenet.dl.sourceforge.net/project/antix-linux/Final/antiX-23.2/runit-antiX-23.2/antiX-23.2-runit_x64-full.iso?viasf=1
wget -c https://tenet.dl.sourceforge.net/project/antix-linux/Final/antiX-23.2/antiX-23.2_386-full.iso?viasf=1
wget -c https://tenet.dl.sourceforge.net/project/antix-linux/Final/antiX-23.2/antiX-23.2_x64-full.iso?viasf=1
wget -c https://cdimage.ubuntu.com/lubuntu/releases/25.04/release/lubuntu-25.04-desktop-amd64.iso
wget -c https://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/25.04/release/xubuntu-25.04-desktop-amd64.iso
wget -c https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.10.0-amd64-standard.iso
wget -c https://mirror.leaseweb.com/devuan/devuan_daedalus/installer-iso/devuan_daedalus_5.0.1_amd64_netinstall.iso
wget -c https://mirror.leaseweb.com/devuan/devuan_daedalus/installer-iso/devuan_daedalus_5.0.1_i386_netinstall.iso

cd ..

echo "Downloading done!"
