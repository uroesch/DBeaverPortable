$AppRoot        = "$PSScriptRoot\..\.."
$AppInfoIni     = "$AppRoot\App\AppInfo\appinfo.ini"
$PackageVersion = '6.3.5.0'
$DisplayVersion = '6.3.5-beta1-uroesch'
$ZipVersion     = '6.3.5'
$Archive64URL   = "https://dbeaver.io/files/6.3.5/dbeaver-ce-$ZipVersion-win32.win32.x86_64.zip"
$TargetDir64    = 'DBeaver'
$ExtractDir64   = 'DBeaver'

Function Url-Basename {
  param(
    [string] $URL
  )
  $Elements = $URL.split('/')
  $Basename = $Elements[$($Elements.Length-1)]
  return $Basename
}

Function Download-ZIP { 
  param(
    [string] $URL
  )
  $PathZip = "$PSScriptRoot\$(Url-Basename -URL $URL)"
  If (!(Test-Path $PathZip)) {
    Invoke-WebRequest -Uri $URL -OutFile $PathZip
  }
  return $PathZip
}

Function Update-Zip {
  param(
    [string] $URL,
    [string] $TargetDir,
    [string] $ExtractDir
  )
  $ZipFile    = $(Download-ZIP -URL $URL)
  $TargetPath = "$AppRoot\App\$TargetDir"
  Expand-Archive -LiteralPath $ZipFile -DestinationPath $PSScriptRoot -Force
  If (Test-Path $TargetPath) {
    Write-Output "Removing $TargetPath"
    Remove-Item -Path $TargetPath -Force -Recurse
  }
  Move-Item -Path $PSScriptRoot\$ExtractDir -Destination $TargetPath -Force
  Remove-Item $ZipFile
}

Function Update-Appinfo() {
  param(
    [string] $IniFile,
	[string] $Match,
	[string] $Replace
  )
  If (Test-Path $IniFile) {
    $Content = (Get-Content $IniFile)
	$Content -replace $Match,$Replace | Out-File -FilePath $IniFile
  }
}

Update-ZIP -URL $Archive64URL -TargetDir $TargetDir64 -ExtractDir $ExtractDir64
Update-Appinfo -IniFile $AppInfoIni -Match '^PackageVersion\s*=.*' -Replace "PackageVersion=$PackageVersion"
Update-Appinfo -IniFile $AppInfoIni -Match '^DisplayVersion\s*=.*' -Replace "DisplayVersion=$DisplayVersion"
