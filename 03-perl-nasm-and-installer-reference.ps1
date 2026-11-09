<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Download and extract Strawberry Perl and NASM, then launch the Visual Studio installer.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows build host.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user for downloads/extraction; Visual Studio setup requests administrative elevation.
Prerequisites: Internet access, existing download folder, BITS, Expand-Archive. Browser download of VisualStudioSetup.exe is a manual prerequisite.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Example C7-C9. Download Strawberry Perl and display its SHA256.
# Compare the value with the official release page before extraction.
<#
$PreDownloadsPath = 'C:\Tools\PreDownloads'
$BuildToolsPath = 'C:\Tools\BuildTools'
New-Item -Type Directory $BuildToolsPath -ErrorAction SilentlyContinue
$strawberryPerlUrl = "https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_54231_64bit/strawberry-perl-5.42.3.1-64bit-portable.zip"
Start-BitsTransfer `
    -Source $strawberryPerlUrl `
    -Destination "$PreDownloadsPath\strawberry-perl-5.42.3.1-64bit-portable.zip"
$strawberryPerlHash = Get-FileHash `
    -Path "C:\Tools\PreDownloads\strawberry-perl-5.42.3.1-64bit-portable.zip" `
    -Algorithm SHA256
$strawberryPerlHash.Hash
#>

# Example C11-C12. Start extraction in the current PowerShell session and check its state.
# Keep this PowerShell session open through the job check in example F.
<#
Start-Job -Name ExtractSBPerl -ScriptBlock {
    $PreDownloadsPath = 'C:\Tools\PreDownloads'
    $BuildToolsPath = 'C:\Tools\BuildTools'
    Expand-Archive `
        -Path "$PreDownloadsPath\strawberry-perl-5.42.3.1-64bit-portable.zip" `
        -DestinationPath "$BuildToolsPath\strawberry-perl-5.42.3.1-64bit-portable"
}
Get-Job -Name ExtractSBPerl
#>

# Example D3. Download NASM, calculate its hash, and extract.
# The NASM hash command calculates a local digest. The final script states that
# the NASM download page supplies no published digest for comparison.
<#
$PreDownloadsPath = 'C:\Tools\PreDownloads'
$BuildToolsPath = 'C:\Tools\BuildTools'
$NASMUrl = "https://www.nasm.us/pub/nasm/releasebuilds/3.02/win64/nasm-3.02-win64.zip"
Start-BitsTransfer `
    -Source $NASMUrl `
    -Destination "$PreDownloadsPath\nasm-3.02-win64.zip"
$nasmHash = Get-FileHash `
    -Path "$PreDownloadsPath\nasm-3.02-win64.zip" `
    -Algorithm SHA256
$NASMHash.Hash
Expand-Archive `
    -Path "$PreDownloadsPath\nasm-3.02-win64.zip" `
    -DestinationPath "$BuildToolsPath\nasm-3.02-win64"
#>

# Example E4. Download the Visual Studio Community installer first.
# The demonstrated relative path assumes the current directory is the user profile.
# Acknowledge UAC and select Desktop development with C++ in the installer.
<#
.\Downloads\VisualStudioSetup.exe
#>
