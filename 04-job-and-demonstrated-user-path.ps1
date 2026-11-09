<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Check extraction and reproduce the demonstrated user PATH example.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows build host, same interactive PowerShell session that created ExtractSBPerl.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user; write access to current user environment variables.
Prerequisites: Perl extraction job from section C, NASM extraction, and $BuildToolsPath defined in this interactive session. GUI and PowerShell PATH procedures are alternatives.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Example F1-F2. Check the background job and inspect completed extraction folders.
# Continue after the job reports Completed and the tool executables exist.
<#
Get-Job -Name ExtractSBPerl
Get-ChildItem -Path "$BuildToolsPath\strawberry-perl-5.42.3.1-64bit-portable\"
Get-ChildItem -Path "$BuildToolsPath\nasm-3.02-win64\nasm-3.02"
#>

# Example F11-F16. Alternative to the GUI user PATH procedure.
# This literal demonstration assumes a nonempty existing User PATH ends in a
# semicolon. Inspect the boundary before saving. Repeating it can add duplicates.
# The separate 04b file contains the previously requested User/Process alternative.
<#
$PreDownloadsPath = 'C:\Tools\PreDownloads'
$BuildToolsPath = 'C:\Tools\BuildTools'
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$userPath
$strawberryPerlPath = "$BuildToolsPath\strawberry-perl-5.42.3.1-64bit-portable\perl\bin;"
$nasmPath = "$BuildToolsPath\nasm-3.02-win64\nasm-3.02;"
$newPath = $userPath + $strawberryPerlPath + $nasmPath
$newPath
[Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
#>
# Open a fresh x64 Native Tools Command Prompt for VS for the next reference.
