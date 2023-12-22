#!/usr/bin/env pwsh
# inherited from https://github.com/release-lab/install

$ErrorActionPreference = 'Stop'

$githubUrl = "https://github.com"
$owner = "quixio"
$repoName = "quix-cli"
$exeName = "quix"

if ([System.Environment]::Is64BitOperatingSystem) {
    $architecture = [System.Environment]::GetEnvironmentVariable("PROCESSOR_ARCHITECTURE")
    if ($architecture -eq "ARM64") {
        $arch = "arm64"
    } else {
        $arch = "x64"
    }
} else {
    throw "Unsupported architecture: 32-bit operating system"
}

$BinDir = "$Home\bin"
$downloadedExe = "$BinDir\${exeName}.exe"
$Target = "win-$arch"
$downloadedZip = "$BinDir\${Target}.zip"

# GitHub requires TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$version = $args[0]

$ResourceUri = if (!$version) {
    "${githubUrl}/${owner}/${repoName}/releases/latest/download/${Target}.zip"
} else {
    "${githubUrl}/${owner}/${repoName}/releases/download/${version}/${Target}.zip"
}


if (!(Test-Path $BinDir)) {
  New-Item $BinDir -ItemType Directory | Out-Null
}

Invoke-WebRequest $ResourceUri -OutFile $downloadedZip -UseBasicParsing -ErrorAction Stop

if (Get-Command Expand-Archive -ErrorAction Ignore) {
    Expand-Archive -Path $downloadedZip -DestinationPath $BinDir -Force
}
else {
    function Expand-Zip($zipFile, $dest) {

        if (-not (Get-Command Expand-7Zip -ErrorAction Ignore)) {
            Install-Package -Scope CurrentUser -Force 7Zip4PowerShell > $null
        }

        Expand-7Zip $zipFile $dest
    }

    Expand-Zip $downloadedZip $BinDir
}

Remove-Item $downloadedZip

$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$BinDir;*".ToLower())) {
  [Environment]::SetEnvironmentVariable('Path', "$Path;$BinDir", $User)
  $Env:Path += ";$BinDir"
}

Write-Output "${exeName} was installed successfully to $downloadedExe"
Write-Output "Run '${exeName} --help' to get started"
