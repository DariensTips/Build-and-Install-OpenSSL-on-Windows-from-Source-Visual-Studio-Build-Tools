<#
Title: Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools
Author/channel: Darien Hawkins / Darien's Tips
Purpose: Add the build tools to User and Process PATH using the exact alternative requested earlier for the GitHub package.
Source script filename: OSSLWIN_Title-Script_20261108.txt
Preparation date: 2026-11-08
Tested environment: Author-reported native x64 MSVC build using VC-WIN64A; portable target Windows Server 2025 Insider Preview. Exact Windows build numbers are not stated.
Target system: Windows build host.
Shell: Windows PowerShell 5.1 on Windows, unless the example states otherwise.
Required privileges: Standard user.
Prerequisites: Perl and NASM already extracted. User persists for future sessions; Process updates this session. Existing expandable User PATH entries can be saved as resolved values by the .NET method.
Usage notes: This file is a collection of selectable reference examples. Each example is enclosed in a block comment. Copy the commands inside one example into the stated shell. Follow the README sequence and manual checkpoints.
#>

# Additional reference authorized in the earlier discussion.
# This block supplements the filmed PATH example. Choose one PATH procedure.
# Copy and run the entire block below in the current interactive PowerShell session.
<#
$BuildToolsPath = 'C:\Tools\BuildTools'

$toolPaths = @(
    "$BuildToolsPath\strawberry-perl-5.42.3.1-64bit-portable\perl\bin"
    "$BuildToolsPath\nasm-3.02-win64\nasm-3.02"
)

foreach ($scope in 'User', 'Process') {
    $currentPath = [Environment]::GetEnvironmentVariable('Path', $scope)
    $entries = @($currentPath -split ';' | Where-Object { $_ })
    $missingPaths = @($toolPaths | Where-Object { $_ -notin $entries })

    if ($missingPaths.Count -gt 0) {
        $newPath = ($entries + $missingPaths) -join ';'
        [Environment]::SetEnvironmentVariable('Path', $newPath, $scope)
    }
}
#>
