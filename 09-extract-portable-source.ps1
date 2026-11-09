<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Extract fresh source trees for the two portable build consoles.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows build host.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user with write access to download/source directories.
Prerequisites: Both OpenSSL tarballs available, native tar.exe, and new source destinations. Open one x64 Native Tools console per version next.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Example H2. The demonstrated extraction paths intentionally create the nested
# source directories used by the two CMD reference files.
<#
$PreDownloadsPath = 'C:\Tools\PreDownloads'
$PortableExtract35 = "openssl-3.5.9-portable\openssl-3.5.9"
$PortableExtract41 = "openssl-4.1.0-portable\openssl-4.1.0"

New-Item -Type Directory $PreDownloadsPath\$PortableExtract35 -ErrorAction SilentlyContinue
New-Item -Type Directory $PreDownloadsPath\$PortableExtract41 -ErrorAction SilentlyContinue
tar.exe -xzf "$PreDownloadsPath\openssl-3.5.9.tar.gz" -C "$PreDownloadsPath\$PortableExtract35"
tar.exe -xzf "$PreDownloadsPath\openssl-4.1.0.tar.gz" -C "$PreDownloadsPath\$PortableExtract41"
#>
