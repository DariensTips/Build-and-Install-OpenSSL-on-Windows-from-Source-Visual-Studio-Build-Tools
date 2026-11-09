<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Show Schannel component version, Windows provider inventory, and random hexadecimal output.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows workstation/build host.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user.
Prerequisites: Windows CertUtil and Schannel DLL. These local checks use several Windows cryptographic components.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Example A2. Display Schannel component file version information.
<#
(Get-Item "$env:windir\System32\schannel.dll").VersionInfo
#>

# Example A3. Define the two helpers exactly as demonstrated, then call them.
# The provider parser uses the English CertUtil output labels in the recording.
<#
function Get-CertificateProviders {
    $providerText = (certutil.exe -csplist) -join "`n"
    $pattern = '(?m)^[ \t]*Provider Name:[ \t]*(?<Name>[^\r\n]+)(?:\r?\n[ \t]*Provider Type:[ \t]*(?<Type>[^\r\n]+))?'

    [regex]::Matches($providerText, $pattern) | ForEach-Object {
        [pscustomobject]@{
            Provider = $_.Groups['Name'].Value.Trim()
            Type     = $_.Groups['Type'].Value.Trim()
        }
    } | Format-Table -AutoSize -Wrap
}

function Generate-32CharRandomHex {
    $bytes = New-Object byte[] 16
    $rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
    $rng.GetBytes($bytes)
    [BitConverter]::ToString($bytes).Replace('-', '').ToLowerInvariant()
}

Get-CertificateProviders
Generate-32CharRandomHex
#>
