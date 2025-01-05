@{
    ListVersions = {
        Get-GitHubRelease restic/restic `
            | ? Version -ge "0.8.0" <# no support for --cache-dir #> `
            | Get-GitHubAsset "restic_*_windows_amd64.zip", "SHA256SUMS"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-HashFromChecksumFile $_.Asset[1].Url $_.Asset[0].Name
        }
    }
}