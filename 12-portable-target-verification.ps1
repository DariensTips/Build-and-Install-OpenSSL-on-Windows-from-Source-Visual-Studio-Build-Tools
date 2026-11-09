<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Extract copied portable builds and reproduce before/after runtime checks on the clean destination.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Clean Windows Server 2025 Insider Preview destination stated in final script.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user for extraction/execution with folder access; administrative approval for VC++ Redistributable setup.
Prerequisites: Both installed version folders copied in the expected ZIP layout, official x64 VC++ Redistributable executable available, and configured paths preserved. Keep one PowerShell session through the checks.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Manual prerequisites I1-I4. Compress the two installed version folders into
# openssl-portable.zip, copy the ZIP and VC_redist.x64.exe to this user's Downloads.
# The ZIP root should contain openssl-4.1.0-portable and openssl-3.5.9-portable.

# Example I5. Extract to the configured destination root.
<#
Expand-Archive $env:userprofile\Downloads\openssl-portable.zip -DestinationPath c:\openssl-portable
#>

# Example I6. Verify the portable 4.1.0 build.
<#
$openssl = 'C:\openssl-portable\openssl-4.1.0-portable\bin\openssl.exe'

& $openssl version -a
& $openssl list -providers
& $openssl rand -hex 16
#>

# Examples I7-I8. Try the shared 3.5.9 LTS build before the runtime install.
# The script reports no console output on the author's clean target.
<#
$openssl = 'C:\openssl-portable\openssl-3.5.9-portable\bin\openssl.exe'

& $openssl version -a
& $openssl list -providers
& $openssl rand -hex 16
#>

# Example I10. Install the official x64 Visual C++ Redistributable.
# Acknowledge elevation if prompted. Allow setup to finish before I11.
<#
& $env:userprofile\Downloads\VC_redist.x64.exe /passive
#>

# Example I11. Keep $openssl pointing to the 3.5.9 LTS executable and rerun.
<#
& $openssl version -a
& $openssl list -providers
& $openssl rand -hex 16
#>
