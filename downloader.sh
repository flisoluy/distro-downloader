#!/bin/bash

set -euo pipefail

# --- CLEANUP ---
CURRENT_FILE=""

cleanup() {
    if [[ -n "$CURRENT_FILE" && -f "$CURRENT_FILE" ]]; then
        echo -ne "\n>>> Script ended unexpectedly. Cleaning up: $(basename "$CURRENT_FILE")"
        rm -f "$CURRENT_FILE"
    fi
}

trap cleanup EXIT

# --- VERSION CONFIGURATION ---
MANJARO_VER="26.0.4"
MANJARO_DATE="260327"
MANJARO_KERNEL="linux618"
MINT_VER="22.3"
FEDORA_VER="43"
FEDORA_RESPIN="1.6"
DEBIAN_VER="13.4.0"
UBUNTU_VER="25.10"
TRISQUEL_VER="12.0"
MX_VER="25.1"
ANTIX_VER="26"
DEVUAN_VER="6.1.0"
DEVUAN_CODENAME="excalibur"

# --- SCRIPT LOGIC ---
OUTDIR="./distros"
mkdir -p "$OUTDIR"

# Global flag for check mode
CHECK_MODE=false

# --- CORE FUNCTIONS ---
check_category() {
    local category_name="$1"
    shift
    local urls=("$@")

    echo ">>> Checking URLs for $category_name distributions..."

    for url in "${urls[@]}"; do
        if [[ -n "$url" ]]; then
            local filename
            filename=$(basename "$url")
            filename="${filename%%\?*}" # Strips URL parameters for clean display

            echo -n ">>> Checking $filename... "

            # Get the status code using curl
            local status_code
            status_code=$(curl -s -o /dev/null -I -w "%{http_code}" "$url")

            case "$status_code" in
                200)
                    echo "OK (Status: $status_code)"
                    ;;
                3??)
                    echo "REDIRECT (Status: $status_code)"
                    ;;
                *)
                    echo "ERROR (Status: $status_code)"
                    ;;
            esac
        fi
    done

    echo ">>> $category_name checking complete."
    echo "======================================================"
}

download_category() {
    local category_name="$1"
    shift
    local urls=("$@")

    echo ">>> Downloading $category_name distributions..."
    mkdir -p "$OUTDIR/$category_name"
    cd "$OUTDIR/$category_name"

    for url in "${urls[@]}"; do
        if [[ -n "$url" ]]; then
            local filename
            filename=$(basename "$url")
            filename="${filename%%\?*}"

            # Skip if file exists
            if [[ -f "$filename" ]]; then
                echo ">>> Skipping $filename (already exists)."
                continue
            fi

            echo ">>> Fetching $filename..."

            CURRENT_FILE="$(pwd)/$filename"
            curl -L --fail -o "$filename" --remote-time "$url"
            CURRENT_FILE=""
        fi
    done

    cd ../..
    echo ">>> $category_name downloads complete."
    echo "======================================================"
}

process_category() {
    if [[ "$CHECK_MODE" == true ]]; then
        check_category "$@"
    else
        download_category "$@"
    fi
}

# --- HIGH-END DISTROS ---
HIGH_END_URLS=(
    "https://download.manjaro.org/kde/${MANJARO_VER}/manjaro-kde-${MANJARO_VER}-${MANJARO_DATE}-${MANJARO_KERNEL}.iso"
    "https://download.manjaro.org/gnome/${MANJARO_VER}/manjaro-gnome-${MANJARO_VER}-${MANJARO_DATE}-${MANJARO_KERNEL}.iso"
    "https://mirror.undernet.uy/linuxmint/isos/stable/${MINT_VER}/linuxmint-${MINT_VER}-cinnamon-64bit.iso"
    "https://mirror.undernet.uy/linuxmint/isos/stable/${MINT_VER}/linuxmint-${MINT_VER}-mate-64bit.iso"
    "https://edgeuno-bog2.mm.fcix.net/fedora/linux/releases/${FEDORA_VER}/Workstation/x86_64/iso/Fedora-Workstation-Live-${FEDORA_VER}-${FEDORA_RESPIN}.x86_64.iso"
    "https://edgeuno-bog2.mm.fcix.net/fedora/linux/releases/${FEDORA_VER}/KDE/x86_64/iso/Fedora-KDE-Desktop-Live-${FEDORA_VER}-${FEDORA_RESPIN}.x86_64.iso"
    "https://debian.repo.cure.edu.uy/isos/current-live/amd64/iso-hybrid/debian-live-${DEBIAN_VER}-amd64-kde.iso"
    "https://debian.repo.cure.edu.uy/isos/current-live/amd64/iso-hybrid/debian-live-${DEBIAN_VER}-amd64-gnome.iso"
    "https://cdimage.ubuntu.com/kubuntu/releases/${UBUNTU_VER}/release/kubuntu-${UBUNTU_VER}-desktop-amd64.iso"
    "https://releases.ubuntu.com/${UBUNTU_VER}/ubuntu-${UBUNTU_VER}-desktop-amd64.iso"
)

# --- MEDIUM-END DISTROS ---
MEDIUM_END_URLS=(
    "https://download.manjaro.org/xfce/${MANJARO_VER}/manjaro-xfce-${MANJARO_VER}-${MANJARO_DATE}-${MANJARO_KERNEL}.iso"
    "https://mirror.undernet.uy/linuxmint/isos/stable/${MINT_VER}/linuxmint-${MINT_VER}-xfce-64bit.iso"
    "https://debian.repo.cure.edu.uy/isos/current-live/amd64/iso-hybrid/debian-live-${DEBIAN_VER}-amd64-xfce.iso"
    "https://trisquel.c3sl.ufpr.br/iso/trisquel_${TRISQUEL_VER}_amd64.iso"
    "https://trisquel.c3sl.ufpr.br/iso/trisquel-mini_${TRISQUEL_VER}_amd64.iso"
)

# --- LOW-END DISTROS ---
LOW_END_URLS=(
    "https://sitsa.dl.sourceforge.net/project/mx-linux/Final/Xfce/MX-${MX_VER}_Xfce_x64.iso?viasf=1"
    "https://sitsa.dl.sourceforge.net/project/antix-linux/Final/antiX-${ANTIX_VER}/antiX-${ANTIX_VER}_386-full.iso?viasf=1"
    "https://sitsa.dl.sourceforge.net/project/antix-linux/Final/antiX-${ANTIX_VER}/antiX-${ANTIX_VER}_x64-full.iso?viasf=1"
    "https://cdimage.ubuntu.com/lubuntu/releases/${UBUNTU_VER}/release/lubuntu-${UBUNTU_VER}-desktop-amd64.iso"
    "https://mirror.us.leaseweb.net/ubuntu-cdimage/xubuntu/releases/${UBUNTU_VER}/release/xubuntu-${UBUNTU_VER}-desktop-amd64.iso"
    "https://debian.repo.cure.edu.uy/isos/current-live/amd64/iso-hybrid/debian-live-${DEBIAN_VER}-amd64-standard.iso"
    "https://mirror.leaseweb.com/devuan/devuan_${DEVUAN_CODENAME}/installer-iso/devuan_${DEVUAN_CODENAME}_${DEVUAN_VER}_amd64_netinstall.iso"
)

# --- INTERACTIVE PROMPT ---
echo "======================================================"
echo "Mode Selection"
echo "======================================================"
read -p "Run in CHECK MODE? (Verifies URLs without downloading) (y/N): " is_check

if [[ "$is_check" =~ ^[Yy]$ ]]; then
    CHECK_MODE=true
fi

echo "======================================================"
echo "Select Categories"
echo "======================================================"
read -p "Process High-End distros? (y/N): " dl_high
read -p "Process Medium-End distros? (y/N): " dl_med
read -p "Process Low-End distros? (y/N): " dl_low
echo "======================================================"

# Execute based on user input
if [[ "$dl_high" =~ ^[Yy]$ ]]; then
    process_category "HighEnd" "${HIGH_END_URLS[@]}"
fi

if [[ "$dl_med" =~ ^[Yy]$ ]]; then
    process_category "MediumEnd" "${MEDIUM_END_URLS[@]}"
fi

if [[ "$dl_low" =~ ^[Yy]$ ]]; then
    process_category "LowEnd" "${LOW_END_URLS[@]}"
fi

echo "All selected tasks completed!"
