﻿$ErrorActionPreference = 'Stop';

$packageName    = 'unity-il2cpp'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://download.unity3d.com/download_unity/becced5a802b/TargetSupportInstaller/UnitySetup-Windows-IL2CPP-Support-for-Editor-2020.2.4f1.exe'
$checksum64     = '098422916983a0a104224e8f5abf6564a7ff47204094642fc4efcbd0526189a1'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum       = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
