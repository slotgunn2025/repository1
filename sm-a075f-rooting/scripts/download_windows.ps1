<# PowerShell helper to download essential files for SM-A075F rooting toolkit
# Note: Some downloads require manual interaction or acceptance of terms on the host site.
# Run as Administrator when needed.

$ErrorActionPreference = 'Stop'
$downloadDir = Join-Path -Path $PSScriptRoot -ChildPath '..\\downloads'
New-Item -ItemType Directory -Path $downloadDir -Force | Out-Null

Write-Host "Download directory: $downloadDir" -ForegroundColor Cyan

# Odin (GetDroidTips mirror)
$odinUrl = 'https://dl.getdroidtips.com/odin/Odin3_v3.14.4.zip'
$odinZip = Join-Path $downloadDir 'Odin3_v3.14.4.zip'

Write-Host "Downloading Odin..."
Invoke-WebRequest -Uri $odinUrl -OutFile $odinZip
Write-Host "Saved: $odinZip"

# Samsung USB drivers (official page - user must download manually due to redirects)
$samsungDriverPage = 'https://developer.samsung.com/mobile/android-usb-driver.html'
Write-Host "Samsung USB drivers page (open in browser to download): $samsungDriverPage"

# Magisk (latest release page) - we download the latest APK release page link but user should verify
$magiskReleases = 'https://github.com/topjohnwu/Magisk/releases/latest'
Write-Host "Open Magisk releases page to download the latest APK and ZIP: $magiskReleases"

Write-Host "Downloads prepared. Please verify downloaded files and move stock firmware AP_*.tar.md5 into sm-a075f-rooting/firmware/ when ready." -ForegroundColor Green
