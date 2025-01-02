param(
        [Parameter(Mandatory)]
        [string]
    $PogPath
)

Set-StrictMode -Version 3
$ErrorActionPreference = "Stop"


$ArchivePath = "${PogPath}.zip"

$ReleaseUrl = (Invoke-RestMethod https://api.github.com/repos/MatejKafka/Pog/releases/latest).assets.browser_download_url
iwr $ReleaseUrl -OutFile $ArchivePath

# unpack Pog, tar is much faster than Expand-Archive
$null = mkdir $PogPath
tar -xf $ArchivePath --directory $PogPath

# setup Pog
& $PogPath\Pog\setup.ps1 -Enable None

# propagate PATH and PSModulePath for the following steps
Add-Content $env:GITHUB_PATH (Resolve-Path $PogPath\Pog\data\package_bin)
Add-Content $env:GITHUB_ENV "PSModulePath=$env:PSModulePath"
