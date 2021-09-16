﻿$ErrorActionPreference = 'Stop';

$packageName    = 'unity-ios'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://download.unity3d.com/download_unity/f2d5d3c59f8c/TargetSupportInstaller/UnitySetup-iOS-Support-for-Editor-2021.1.21f1.exe'
$checksum64     = '7fa108740d4dcd7a42bb0a9ec8ebc60420114a5644d8ec12da071793cf3af9a3'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
