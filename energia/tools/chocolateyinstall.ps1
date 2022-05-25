﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url32          = 'https://energia.nu/downloads/downloadv4.php?file=energia-1.8.10E23-windows.zip'
$checksum32     = '878d0082a1dbbd42dccaea1a5f2d4ece9c0a5d47a6bc6778c4392837e2f228eb'
$folderName     = 'energia-1.8.10E23'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$installFolder = Join-Path -Path $toolsDir -ChildPath $folderName
$files = Get-ChildItem $installFolder -Include *.exe -Recurse

foreach ($file in $files) {
  if (!($file.Name.Equals("energia.exe"))) {
    #generate an ignore file
    New-Item "$file.ignore" -type file -Force | Out-Null
  }
  else {
    New-Item "$file.gui" -type file -Force | Out-Null
  }
}

$desktopPath = [Environment]::GetFolderPath("Desktop")

Install-ChocolateyShortcut `
  -ShortcutFilePath "$desktopPath\Energia.lnk" `
  -TargetPath "$env:ChocolateyInstall\bin\energia.exe"
