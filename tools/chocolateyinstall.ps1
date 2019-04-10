$ErrorActionPreference = 'Stop';

$packageName = 'terraform-docs'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum = 'A323C0D36CE53AC3FB531035C84FE335F10CD51F60B697674BAB47A34A70E49E'
$url        = 'https://github.com/segmentio/terraform-docs/releases/download/v0.6.0/terraform-docs-v0.6.0-windows-amd64.exe'
$destination = "$toolsDir\terraform-docs-v0.6.0-windows-amd64.exe"

if (Test-Path "$toolsDir\terraform-docs.exe") {
	Remove-Item "$toolsDir\terraform-docs.exe"
	Uninstall-BinFile -Name "terraform-docs" -Path "$toolsDir"
}

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256 -ChecksumType sha256

Rename-Item -Path "$toolsDir\terraform-docs-v0.6.0-windows-amd64.exe" -NewName "terraform-docs.exe"
