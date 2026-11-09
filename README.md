# Build and Install OpenSSL on Windows from Source | Visual Studio Build Tools

## Video

Video URL — **Add the published YouTube video URL here.**

Repository — https://github.com/DariensTips/Build-and-Install-OpenSSL-on-Windows-from-Source-Visual-Studio-Build-Tools

| Header field | Details |
|---|---|
| Title | Build and Install OpenSSL on Windows from Source \| Visual Studio Build Tools |
| Author / channel | Darien Hawkins / Darien's Tips |
| Purpose | Reference commands for compiling, testing, and installing native x64 OpenSSL and copying two compiled builds to a clean Windows target. |
| Source script filename | `OSSLWIN_Title-Script_20261108.txt` |
| Preparation date | November 8, 2026 |
| Tested environment stated in the script | Native x64 MSVC target `VC-WIN64A`. The portable destination is a clean Windows Server 2025 Insider Preview instance. Exact Windows build numbers and the build host's Windows edition are not stated. |
| Usage notes | Copy individual examples into the specified shell and follow the manual checkpoints. The commands retain the final script's parameters, order, and demonstrated paths. |

## Overview

The video compiles OpenSSL 4.1.0 using the C++ build tools installed with Visual Studio and performs a standard installation into the default Windows directories. It also compiles a static OpenSSL 4.1.0 build and a shared OpenSSL 3.5.9 LTS build into separate portable installation folders. The author copies both installed trees to a clean Windows Server 2025 Insider Preview destination and checks the executable version, loaded providers, and random hexadecimal output.

The introductory Windows examples display the Schannel DLL version, format the installed Windows cryptographic provider inventory from CertUtil, and generate 16 random bytes through .NET. These examples use several Windows cryptographic components. OpenSSL's loaded provider list and the machine-wide Windows CSP/KSP inventory describe different scopes.

## How to use the references

1. Open the reference file as text and copy one example at a time. Each example in a `.ps1` reference is enclosed in a block comment, delimited by `<#` and `#>`. Copy the commands **inside** the delimiters into the stated PowerShell session. Opening or running the reference file itself performs no actions.
2. The CMD references end in `.cmd.txt` so they open as text. Copy their commands into the x64 Native Tools Command Prompt for VS. Instructions prefixed with `REM` identify separate checkpoints.
3. Keep the PowerShell session that starts the Strawberry Perl extraction job open until the section F job check. Variables and the job in this workflow belong to that interactive session.
4. Treat the GUI PATH steps, the demonstrated PowerShell PATH block, and the separate User/Process PATH block as alternative procedures. Choose one procedure for your system.
5. Use separate source directories and separate x64 Native Tools consoles for the two portable builds. Run each installation example after its own test suite reports `Result: PASS`.
6. Where a path differs in your environment, edit every corresponding occurrence, including the variables inside the background job, the CMD `cd` commands, and the portable install and destination paths.

These are reference examples with manual decisions and checks. Browser downloads, installer selections, ZIP creation/copying, PATH dialog changes, and waiting for setup or test completion remain explicit steps in the workflow.

## Prerequisites

- A supported x64 Windows build host for the Visual Studio IDE used in the demonstration. The script names Windows 11, including Home, and Windows Server 2019, 2022, or 2025 Standard or Datacenter with Desktop Experience. Consult Visual Studio's current requirements for the supported editions and versions.
- Visual Studio Community with the **Desktop development with C++** workload, MSVC Build Tools for x64/x86, and the Windows 11 SDK shown in the recording. Licensed Professional or Enterprise editions can supply the same required workload.
- OpenSSL **4.1.0** and **3.5.9 LTS** source tarballs. Use each release's published SHA-256 file for the comparisons shown.
- **Strawberry Perl 5.42.3.1**, 64-bit portable ZIP.
- **NASM 3.02**, Windows x64 ZIP.
- Windows PowerShell, BITS / `Start-BitsTransfer`, `Expand-Archive`, native `tar.exe`, and write access to the download and source folders.
- Administrative approval to install Visual Studio, write a default OpenSSL installation into Program Files, change the system PATH, and install the Visual C++ Redistributable on the destination.
- For the shared 3.5.9 deployment, the official **x64 Visual C++ Redistributable** compatible with the MSVC tools used for the build.

## Command sequence and reference files

| Video section | Reference file | System, shell, and privileges | Purpose and prerequisites |
|---|---|---|---|
| A | [01-windows-crypto-reference.ps1](01-windows-crypto-reference.ps1) | Windows workstation, standard PowerShell | Show Schannel component version, Windows provider names/types, and 32-character random hexadecimal output. CertUtil parser uses English labels. |
| B | [02-download-openssl-reference.ps1](02-download-openssl-reference.ps1) | Build host, standard Windows PowerShell | Inspect the manually downloaded 4.1.0 tarball and checksum, then download/check/extract 3.5.9. Continue after visual hash comparison succeeds. |
| C–E | [03-perl-nasm-and-installer-reference.ps1](03-perl-nasm-and-installer-reference.ps1) | Build host, standard Windows PowerShell. Visual Studio setup requests elevation. | Download portable Perl and NASM, start the Perl extraction job, and launch the downloaded VS installer. |
| F | [04-job-and-demonstrated-user-path.ps1](04-job-and-demonstrated-user-path.ps1) | Same PowerShell session as C, standard user | Check extraction and reproduce the filmed User PATH procedure. Verify the separator boundary before saving. |
| Additional authorized PATH example | [04b-authorized-user-process-path-alternative.ps1](04b-authorized-user-process-path-alternative.ps1) | Build host, standard PowerShell | The exact User/Process alternative requested earlier for this GitHub package. It handles entry separators and skips matching entries already present. |
| F | [05-build-tool-checks.cmd.txt](05-build-tool-checks.cmd.txt) | Fresh x64 Native Tools Command Prompt, standard user | Locate Perl, NASM, MSVC `cl`, and `nmake`, then display versions/help. |
| G | [06-default-build-and-test.cmd.txt](06-default-build-and-test.cmd.txt) | x64 Native Tools Command Prompt, standard user | Configure 4.1.0, build it, and run its test suite. |
| G | [07-default-install-admin.cmd.txt](07-default-install-admin.cmd.txt) | New elevated x64 Native Tools Command Prompt | Install the tested build and open System Properties for the demonstrated System PATH change. |
| G | [08-default-install-verification.ps1](08-default-install-verification.ps1) | Fresh standard PowerShell or Command Prompt | Check installed version, loaded providers, and random output after OpenSSL's bin folder is on PATH. |
| H | [09-extract-portable-source.ps1](09-extract-portable-source.ps1) | Build host, standard Windows PowerShell | Extract fresh portable source trees. The nested directories match the following CMD references exactly. |
| H | [10-portable-4.1.0.cmd.txt](10-portable-4.1.0.cmd.txt) | Native Tools console 1 | Configure/build/test/install the static 4.1.0 release tree. Account must have destination write access. |
| H | [11-portable-3.5.9.cmd.txt](11-portable-3.5.9.cmd.txt) | Native Tools console 2 | Configure/build/test/install the shared 3.5.9 LTS tree. Account must have destination write access. |
| I | [12-portable-target-verification.ps1](12-portable-target-verification.ps1) | Clean Windows Server 2025 Insider Preview destination, PowerShell. Redistributable setup requires elevation. | Extract copied binaries, check 4.1.0, attempt 3.5.9 before the runtime install, install the official x64 runtime, and repeat 3.5.9 checks. |

## Paths and placeholders

The defaults preserve the final script so source extraction, configuration, installation, and copying stay consistent.

| Value | Meaning and editing guidance |
|---|---|
| `C:\Tools\PreDownloads` / `$PreDownloadsPath` | Download staging and extracted source root. Set this in every applicable interactive example and in the extraction job if adapting it. |
| `C:\Tools\BuildTools` / `$BuildToolsPath` | Portable Perl and NASM extraction root. Keep PATH entries consistent with the resulting directory structure. |
| `C:\Program Files\OpenSSL` | Default OpenSSL install root used by section G. |
| `C:\Program Files\Common Files\SSL` | Default OpenSSL configuration and certificate/key directory used by the default build. |
| `C:\openssl-portable` | Portable installation and destination root. The command's `--prefix` and `--openssldir` values determine default runtime paths. |
| `$env:USERPROFILE\Downloads` | ZIP and VC Redistributable staging folder on the portable destination. |
| `.\Downloads\VisualStudioSetup.exe` | Installer path relative to the build host's current directory. The demonstration assumes the user's profile directory is current. |
| Video URL near the top | Replace after the YouTube video is published. The GitHub repository URL is supplied by the author. |

The script has no server-name, domain-name, or IP-address placeholders. Preserve the configured folder layout when copying the installed trees. A ZIP root containing the two version folders extracts directly to `C:\openssl-portable` with the command shown. Copy the complete installed version folders, including the DLLs and configuration files that belong to the selected build.

## Configure options and runtime behavior

| Option | Meaning in these examples |
|---|---|
| `no-makedepend` | Skips dependency generation used for incremental rebuilds. The demonstrated workflow starts with fresh source trees. |
| `no-shared` | Builds static `libssl` and `libcrypto` libraries and links their required code into `openssl.exe`. |
| `enable-static-vcruntime` | Selects static Visual C++ runtime linkage for shared MSVC builds in 4.1.0. For the stock MSVC **release** executable built here with `no-shared`, the configuration already selects `/MT`. Both flags are retained exactly as demonstrated. |
| `--prefix` | Sets the top of the installation directory tree. |
| `--openssldir` | Sets the default OpenSSL configuration and certificate/key locations. It refers to OpenSSL file locations. |

The 3.5.9 command preserves OpenSSL's default shared-library configuration and MSVC dynamic runtime selection (`/MD`). That specific configuration needs the compatible x64 Visual C++ runtime on the destination. The missing `enable-static-vcruntime` option in 3.5.9 explains why that flag is absent from its command. The runtime dependency follows the shared build settings. A stock MSVC release `no-shared` executable in 3.5.9 also selects `/MT`.

OpenSSL's portable paths are configured explicitly in this video. Copying to a different root can require corresponding configuration/module/certificate path adjustments. The examples reproduce the demonstrated matching paths.

## Verification and manual checkpoints

- Compare OpenSSL's SHA-256 values in full before extracting. The commands print the published and computed values for the visual comparison shown. Hexadecimal letter casing can differ.
- Compare the Strawberry Perl digest against the official release's SHA-256. The NASM command calculates a local SHA-256 value. The final script states that the NASM download page supplies no published hash for comparison.
- Keep the Strawberry Perl extraction job's originating session open. Check its recorded state and inspect the extracted folders before proceeding to PATH and build-tool checks.
- Verify the directories printed by `where perl`, `where nasm`, `where cl`, and `where nmake` match the intended toolchain.
- During `nmake test`, console output can pause while a longer test runs. Wait for the final summary and confirm `Result: PASS` before installation. Some tests are skipped for feature/platform reasons in the narrated run.
- In CMD, `nmake && nmake test` starts the test command when the build command succeeds. The separate `nmake install` example follows the successful test summary.
- Confirm any firewall prompt during tests corresponds to the expected test executable.
- Open a fresh terminal after changing PATH. `openssl version -a` reports build and configured directory information, `openssl list -providers` lists loaded providers, and `openssl rand -hex 16` produces 16 random bytes displayed as 32 hexadecimal characters.
- On the portable destination, the absolute `$openssl` assignments identify the exact executable being tested. Allow the Redistributable installer to finish before repeating the shared 3.5.9 checks.

## PATH example scope

The filmed block concatenates the existing User PATH and two tool entries. For a populated User PATH, its existing value must end with a semicolon to separate the first new entry. The block can append duplicate entries if repeated. The GUI procedure and PowerShell procedure perform the same user-level update.

The additional `04b` reference is the complete User and Process PATH block requested earlier for this package. It saves missing entries to the User PATH and updates the current PowerShell process separately. The .NET User PATH getter expands expandable values while reading, so saving through this method can store existing environment-variable references as resolved paths. Use the provided block with awareness of that behavior.

## Testing described in the video and package validation

The final script reports successful default and portable build/test/install sequences, including a passing final test result for each portable build. It reports that portable 4.1.0 ran on the clean Windows Server 2025 Insider Preview destination before the x64 VC++ Redistributable was installed. The shared 3.5.9 commands produced no console output there initially and ran after the runtime installation. Console messages and loader behavior can vary by system.

The three target-side commands are CLI checks of build information, loaded providers, and random output. The video script contains no client/server TLS handshake test. The next video is planned to cover TLS 1.3 handshake testing.

Package preparation transcribed and compared the commands with the supplied final script, checked the file separation and documented the preserved options. No Windows compilation, OpenSSL test suite execution, Windows installation, or target-side executable run was performed during package preparation. The recorded lab results belong to the author.

## Official references

### OpenSSL downloads, source, and release policy

- https://www.openssl.org/
- https://openssl-library.org/source/
- https://github.com/openssl/openssl
- https://openssl-corporation.org/lifecycle.html
- https://openssl-library.org/roadmap/index.html
- https://github.com/openssl/openssl/releases/download/openssl-4.1.0/openssl-4.1.0.tar.gz
- https://github.com/openssl/openssl/releases/download/openssl-4.1.0/openssl-4.1.0.tar.gz.sha256
- https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz
- https://github.com/openssl/openssl/releases/download/openssl-3.5.9/openssl-3.5.9.tar.gz.sha256

### Version-matched OpenSSL build documentation and configuration

- https://github.com/openssl/openssl/blob/openssl-4.1.0/NOTES-WINDOWS.md
- https://github.com/openssl/openssl/blob/openssl-4.1.0/INSTALL.md
- https://github.com/openssl/openssl/blob/openssl-3.5.9/NOTES-WINDOWS.md
- https://github.com/openssl/openssl/blob/openssl-3.5.9/INSTALL.md
- https://github.com/openssl/openssl/blob/openssl-4.1.0/Configurations/10-main.conf
- https://github.com/openssl/openssl/blob/openssl-3.5.9/Configurations/10-main.conf
- https://github.com/openssl/openssl/blob/openssl-4.1.0/Configure
- https://github.com/openssl/openssl/blob/openssl-3.5.9/Configure

### OpenSSL command documentation

- https://docs.openssl.org/4.1/
- https://docs.openssl.org/4.1/man1/openssl-version/
- https://docs.openssl.org/4.1/man1/openssl-list/
- https://docs.openssl.org/4.1/man1/openssl-rand/

### Perl and NASM

- https://www.perl.org/
- https://strawberryperl.com/
- https://strawberryperl.com/releases.html
- https://strawberryperl.com/releases.json
- https://strawberryperl.com/release-notes/5.42.3.1-64bit.html
- https://github.com/StrawberryPerl/Perl-Dist-Strawberry/releases/download/SP_54231_64bit/strawberry-perl-5.42.3.1-64bit-portable.zip
- https://www.nasm.us/
- https://www.nasm.us/pub/nasm/releasebuilds/3.02/win64/
- https://www.nasm.us/pub/nasm/releasebuilds/3.02/win64/nasm-3.02-win64.zip

### Visual Studio, MSVC, NMAKE, and the runtime

- https://visualstudio.microsoft.com/
- https://visualstudio.microsoft.com/vs/community/
- https://learn.microsoft.com/en-us/cpp/build/vscpp-step-0-installation
- https://learn.microsoft.com/en-us/visualstudio/releases/2026/vs-system-requirements
- https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line
- https://learn.microsoft.com/en-us/cpp/build/reference/nmake-reference
- https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-180
- https://learn.microsoft.com/en-us/cpp/build/reference/nmake-reference?view=msvc-180
- https://learn.microsoft.com/en-us/cpp/build/reference/md-mt-ld-use-run-time-library
- https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist
- https://learn.microsoft.com/en-us/cpp/windows/redistributing-visual-cpp-files
- https://aka.ms/vc14/vc_redist.x64.exe

### Windows and PowerShell checks used in the introduction and preparation

- https://learn.microsoft.com/en-us/windows/win32/secauthn/secure-channel
- https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/certutil
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/start-job
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-job
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/expand-archive
- https://learn.microsoft.com/en-us/powershell/module/bitstransfer/start-bitstransfer
- https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables
- https://learn.microsoft.com/en-us/dotnet/api/system.security.cryptography.randomnumbergenerator

Use the documentation and source tag that match the release you are building. The general product and language links are included for the complete reference requested with this package.
