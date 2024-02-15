#!/usr/bin/env pwsh
# inherited from https://github.com/release-lab/install

Write-Output "Installing Quix CLI"
Write-Output ""
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
$Target = "win-$arch"
$downloadedZip = "$BinDir\${Target}.zip"

# GitHub requires TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$ResourceUri = if (!$version) {
    "${githubUrl}/${owner}/${repoName}/releases/latest/download/${Target}.zip"
} else {
    "${githubUrl}/${owner}/${repoName}/releases/download/${version}/${Target}.zip"
    $version = ""
}


if (!(Test-Path $BinDir)) {
  New-Item $BinDir -ItemType Directory | Out-Null
}
Write-Output "[1/5] Detected '${arch}' architecture"
Write-Output "[2/5] Downloading '${Target}.zip' to '${BinDir}'"
Invoke-WebRequest $ResourceUri -OutFile $downloadedZip -UseBasicParsing -ErrorAction Stop

Write-Output "[3/5] Decompressing '${Target}.zip' in '${BinDir}'"
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

Write-Output "[4/5] Cleaning '${downloadedZip}'"

Remove-Item $downloadedZip

Write-Output "[5/5] Adding '${BinDir}' to the environment variables"

$User = [EnvironmentVariableTarget]::User
$Path = [Environment]::GetEnvironmentVariable('Path', $User)
if (!(";$Path;".ToLower() -like "*;$BinDir;*".ToLower())) {
  [Environment]::SetEnvironmentVariable('Path', "$Path;$BinDir", $User)
  $Env:Path += ";$BinDir"
}

Write-Output ""
Write-Output "Quix CLI was installed successfully"
Write-Output "Run '${exeName} --help' to get started"
