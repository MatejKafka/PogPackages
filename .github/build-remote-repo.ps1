param([Parameter(Mandatory)][string]$RemoteRepoDir, [Parameter(Mandatory)][string]$SourceRepoDir)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module Pog
# use the local repository, instead of the default remote repo
Set-PogRepository $SourceRepoDir

# validate the repository before building the remote repo
Confirm-PogRepository -IgnoreMissingHash

$null = mkdir -Force $RemoteRepoDir
cd $RemoteRepoDir

rm -Recurse *

$Packages = [array][Pog.InternalState]::Repository.Enumerate()

$VersionMap = [ordered]@{}
$Packages | % {
    $VersionMap[$_.PackageName] = @($_.EnumerateVersions() | % ToString)
}
# not really html, but whatever
$VersionMap | ConvertTo-Json -Depth 100 -Compress > index.html

# TODO: build in parallel
$TmpPackage = New-PogPackage _zip_export
try {
    $Packages | % {
        $null = mkdir $_.PackageName
        $VersionCounter = 0
        $_.Enumerate() | % {
            $_.ImportTo($TmpPackage)
            Compress-Archive "$($TmpPackage.Path)\*" ".\$($_.PackageName)\$($_.Version).zip"
            $VersionCounter++
        }
        Write-Host "Package '$($_.PackageName)': $VersionCounter versions"
    }
} finally {
    rm -Force -Recurse $TmpPackage.Path
}