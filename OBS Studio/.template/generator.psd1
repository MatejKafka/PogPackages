@{
    ListVersions = {
        $VersionRegex = "[0-9.]+(-beta\d+|-rc\d+)?"
        Get-GitHubRelease obsproject/obs-studio `
            | ? Version -ge 0.13.1 <# portable mode added and assets are named somewhat consistently from here #> `
            | ? {$_.Assets | ? Name -notlike "obs-mac-*"} <# skip Mac-only releases #> `
            | Get-GitHubAsset "^OBS-Studio-$VersionRegex(|-Win|-Windows|-Full|-Full-x64)\.zip`$" -Regex
            #                 ^ OBS only started using remotely consistent naming quite recently
    }

    Generate = {
        # newer releases all have a checksum list in the body, older releases do not seem to have published checksums
        # unfortunately, the checksum list uses a custom formatting (`    FileName: Hash`); sigh
        $Hash = $_.Release.Body -split "`n" | Select-String "   $($_.Asset.Name): " -SimpleMatch -Raw | select -Last 1
        if ($Hash) {
            $Hash = ($Hash -split ": ")[-1].Trim().ToUpperInvariant()
            if ($Hash.Length -ne 64) {
                $Hash = $null
            }
        }

        if (-not $Hash) {
            # not found, calculate the hash locally
            $Hash = Get-UrlHash $_.Asset.Url
        }

        [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = $Hash
        }
    }
}