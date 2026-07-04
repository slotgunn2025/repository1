# SM-A075F Rooting Toolkit

This repository helps you prepare files and instructions to root a Samsung Galaxy SM-A075F (Region: INS). It provides documentation, download helper scripts, and copy-ready flashing steps you can follow on your Windows PC or prepare from the device using Termux.

IMPORTANT: Rooting will almost certainly trip Samsung Knox (irreversible), may void warranty, and can brick the device if incorrect files are used. Read WARNING.md before proceeding.

Repository layout
- INSTRUCTIONS.md — step-by-step workflow (prereqs, patching AP, Odin flash, recovery steps)
- WARNING.md — legal/safety warnings and checklist
- scripts/
  - download_windows.ps1 — PowerShell helper to download Odin, Samsung USB drivers, and Magisk (links may require manual confirmation)
  - download_unix.sh — shell helper to download Magisk and notes about Frija (Frija is Windows-only)
  - termux_prepare.sh — Termux-friendly script to extract AP tar, find boot.img, and move files to shared Downloads for Magisk patching
- firmware/README.md — where to place your downloaded AP_*.tar.md5 (stock firmware)
- .gitignore — ignores large firmware files (you can still upload them manually if you choose)

Next steps
1. Place the stock AP_*.tar.md5 for Model SM-A075F (CSC: INS) into firmware/ and notify me — I can patch the AP for Magisk and return magisk_patched.tar.
2. Or upload screenshots or paste your full Build number (Settings → About phone) and I will find the exact firmware build and provide direct download links.

If you want me to produce the Magisk-patched AP automatically, upload the AP tar into firmware/ and reply here. I will patch it and commit the patched file back into the repo.