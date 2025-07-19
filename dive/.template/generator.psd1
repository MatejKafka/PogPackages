@{
    ListVersions = {
        Get-GitHubRelease wagoodman/dive `
            | ? Version -gt "0.3.0" `
            | Get-GitHubAsset dive_*_windows_amd64.zip
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}