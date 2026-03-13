@{
    ListVersions = {
        Get-GitHubRelease zealdocs/zeal `
            | ? Version -gt 0.3.1 `
            | ? Version -notin 0.6.0 `
            | Get-GitHubAsset zeal-*portable*-windows-x64.7z
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}