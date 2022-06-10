﻿$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://s3.amazonaws.com/aws-cli/AWSCLI32PY3-1.25.6.msi'
$checksum   = 'b820ffca7650e3372799058ea61ba9b039fddbc04d658a2e8f65abaa80d7b9a0'
$url64      = 'https://s3.amazonaws.com/aws-cli/AWSCLI64PY3-1.25.6.msi'
$checksum64 = 'c4020328a62a7c199ef77139398b618fed1104a177a42bd6aa8bb7bf6584e56a'
 
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  softwareName  = 'AWS Command Line Interface*'
  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
