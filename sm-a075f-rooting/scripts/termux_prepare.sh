#!/usr/bin/env bash
# termux_prepare.sh
# Termux-friendly script: extract AP tar, find boot.img, and copy it to shared Downloads for use with Magisk APK on-device.
set -euo pipefail
repo_root="$(cd "$(dirname "$0")/.." && pwd)"
firmware_dir="$repo_root/firmware"

if [ ! -d "$firmware_dir" ]; then
  echo "Firmware directory not found: $firmware_dir"
  exit 1
fi

ap_file=$(ls "$firmware_dir"/AP_*.tar* 2>/dev/null || true)
if [ -z "$ap_file" ]; then
  echo "No AP_*.tar(.md5) file found in $firmware_dir. Please put your AP file there and rerun."
  exit 1
fi

echo "Found AP: $ap_file"

workdir="$firmware_dir/extracted"
mkdir -p "$workdir"
cd "$workdir"

# Extract AP (tar handles many compressions; .md5 wrappers are OK)

if command -v tar >/dev/null 2>&1; then
  tar -xvf "$ap_file"
else
  echo "tar not found. Install tar in Termux: pkg install tar"
  exit 1
fi

# Find boot or recovery images
bootimg=$(find . -type f -iname 'boot*.img' -o -iname '*boot.img' | head -n 1 || true)
recoveryimg=$(find . -type f -iname 'recovery*.img' | head -n 1 || true)

if [ -n "$bootimg" ]; then
  echo "Found boot image: $bootimg"
  cp "$bootimg" ~/storage/downloads/
  echo "Copied boot image to /sdcard/Download/ for Magisk app to patch. Open Magisk app -> Install -> Select and Patch a File -> choose the copied boot image."
else
  echo "No boot image found. List files in extraction folder:"; ls -la
fi

if [ -n "$recoveryimg" ]; then
  echo "Also found recovery image: $recoveryimg"
fi

echo "After Magisk patches, copy magisk_patched.img from /sdcard/Download/ back into $firmware_dir and then transfer to a PC for repacking/flashing." 
