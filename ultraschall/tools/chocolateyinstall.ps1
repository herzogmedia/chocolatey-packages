$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Ultraschall-5.0.3.msi'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'MSI' #only one of these: exe, msi, msu
  file           = $fileLocation

  softwareName   = 'ultraschall*' 
  checksum       = '1591DEF7E4CA32F268026665853697709B2A1761AE28088CF238F75BCE0382EF'
  checksumType   = 'sha256'
  # MSI
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package