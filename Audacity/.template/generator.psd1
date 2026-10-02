@{
    ListVersions = {
        Get-GitHubRelease audacity/audacity -TagPrefix "Audacity-" `
            | ? VersionStr -notin "4.0.0", "4.0.0-beta-4", "4.0.0-beta-2", "4.0.0-alpha-2", "3.2.4", "3.0.3-RC1", "3.0.2", "3.0.0" `
            | ? VersionStr -notin "4.0.1"
            | % {
                $Pattern = switch ($_.Version) {
                    # TODO: Audacity 4 does not support portable mode yet, throw error to recheck for newer releases
                    {$_ -gt "4.0.1"} {throw "Unsupported Audacity release: $_"}
                    #{$_ -ge "4.0.1"} {"audacity-win-*-x86_64.7z"; continue}
                    {$_ -ge "3.7.5"} {"audacity-win-*-64bit.zip"; continue}
                    default {"audacity-win-*-*64*.zip"; continue}
                }
                $_ | Get-GitHubAsset $Pattern -Optional "CHECKSUMS.txt"
            }
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = if ($_.OptionalAsset) {
                # Audacity just dumps a PowerShell formatted table to the checksum file
                $Line = (Invoke-WebRequest $_.OptionalAsset.Url) -split "`n" | Select-String $_.Asset.Name -Raw
                $Hash = -split $Line | ? Length -eq 64
                if (-not $Hash) {throw "Could not find hash."}
                $Hash.ToUpperInvariant()
            } else {
                Get-UrlHash $_.Asset.Url
            }
        }
    }
}