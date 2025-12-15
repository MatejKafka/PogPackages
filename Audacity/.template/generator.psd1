@{
    ListVersions = {
        Get-GitHubRelease audacity/audacity -TagPrefix "Audacity-" `
            | ? VersionStr -notin "4.0.0-alpha-2", "3.2.4", "3.0.3-RC1", "3.0.2", "3.0.0" `
            | % {
                $Pattern = if ($_.Version -ge "3.7.5") {"audacity-win-*-64bit.zip"} else {"audacity-win-*-*64*.zip"}
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