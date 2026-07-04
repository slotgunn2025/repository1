# SM-A075F Rooting Instructions (summary)

This file outlines the practical steps to prepare and flash a Magisk-patched boot image for SM-A075F (region INS). Read WARNING.md first.

Prerequisites
- Windows PC recommended (for Odin). Linux/Mac advanced users can use Heimdall.
- Samsung USB Drivers installed.
- Odin (Windows) latest stable (v3.14.x recommended).
- Magisk APK (latest release from GitHub).
- Stock firmware for SM-A075F (CSC INS). Use Frija (Windows) or SamMobile to download.
- USB cable, battery >50%.

High-level flow
1. Download stock firmware AP_*.tar.md5 for SM-A075F (INS) and place it in firmware/.
2. Extract the AP tar and obtain boot.img (can be done on PC or in Termux on-device).
3. Use Magisk APK on the phone to "Select and Patch a File" and choose boot.img; Magisk will produce magisk_patched.img in Downloads/.
4. Transfer magisk_patched.img to PC and repack into AP tar (or replace boot in original AP). If you're uncertain, upload the AP tar and I will repack it.
5. Boot phone to Download Mode and flash the patched AP tar via Odin (AP slot). Do NOT flash mismatched BL/CP unless you are restoring stock.
6. Reboot and verify Magisk is installed.

Detailed steps and exact commands depend on the exact AP tar layout and your PC OS. If you upload the AP tar or provide the firmware build, I will produce exact repacking and Odin instructions.
