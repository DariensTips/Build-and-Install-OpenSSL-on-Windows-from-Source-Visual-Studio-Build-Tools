<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Verify the manually downloaded 4.1.0 source and download, inspect, and extract 3.5.9 LTS.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows build host.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user with write access to the download folders.
Prerequisites: 4.1.0 tarball and its SHA256 file downloaded manually from the official source page; BITS, native Windows tar.exe, and write access. Keep the same interactive PowerShell session for dependent examples.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Example B9-B13. Download 4.1.0 and its SHA256 file with the browser first.
# Compare the two displayed hash values visually. Continue when they match.
<#
$expectedossl4Hash = Get-Content -Path "C:\Tools\PreDownloads\openssl-4.1.0.tar.gz.sha256"
$actualossl4Hash = Get-FileHash -Path "C:\Tools\PreDownloads\openssl-4.1.0.tar.gz" -Algorithm SHA256
($expectedossl4Hash.Trim() -split '\s+')[0]
$actualossl4Hash.Hash
explorer.exe C:\Tools\PreDownloads
#>
# B14-B16 manual step. Use Extract All for the 4.1.0 tarball with the demonstrated default destination.

# Example B18-B20. Download the 3.5.9 LTS tarball and checksum.
<#
$PreDownloadsPath = 'C:\Tools\PreDownloads'
New-Item -Type Directory $PreDownloadsPath -ErrorAction SilentlyContinue
$OpenSSL35LTSSource = "https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz"
$OpenSSL35LTSSha256Source = "https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz.sha256"
Start-BitsTransfer `
    -Source $OpenSSL35LTSSource `
    -Destination "$PreDownloadsPath\openssl-3.5.9.tar.gz"
Start-BitsTransfer `
    -Source $OpenSSL35LTSSha256Source `
    -Destination "$PreDownloadsPath\openssl-3.5.9.tar.gz.sha256"
#>

# Example B21. Compare the displayed values visually before extraction.
<#
$expectedossl35Hash = Get-Content -Path "$PreDownloadsPath\openssl-3.5.9.tar.gz.sha256"
$actualossl35Hash = Get-FileHash -Path "$PreDownloadsPath\openssl-3.5.9.tar.gz" -Algorithm SHA256
($expectedossl35Hash.Trim() -split '\s+')[0]
$actualossl35Hash.Hash
#>

# Example B22-B26. Extract and inspect.
<#
New-Item -Type Directory $PreDownloadsPath\openssl-3.5.9 -ErrorAction SilentlyContinue
tar.exe -xzf "$PreDownloadsPath\openssl-3.5.9.tar.gz" -C "$PreDownloadsPath\openssl-3.5.9"
Get-ChildItem -Path $PreDownloadsPath
Get-ChildItem -Path $PreDownloadsPath\openssl-3.5.9\openssl-3.5.9
Get-ChildItem -Path $PreDownloadsPath\openssl-4.1.0\openssl-4.1.0
#>
