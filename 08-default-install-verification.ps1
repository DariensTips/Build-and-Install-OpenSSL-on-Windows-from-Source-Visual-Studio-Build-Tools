<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Show installed OpenSSL build information, loaded providers, and hexadecimal random bytes.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows build host after default installation.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user.
Prerequisites: Default installation completed and C:\Program Files\OpenSSL\bin on PATH. These commands also run in a standard Command Prompt.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Example G24. Run in a fresh standard terminal after adding OpenSSL bin to PATH.
<#
openssl version -a
openssl list -providers
openssl rand -hex 16
#>
