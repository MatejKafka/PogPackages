@{
    ListVersions = {
        Get-GitHubRelease facebook/zstd `
            | ? {$_.Version -ge "1.2.0"} `
            | Get-GithubAsset "*zstd-v*-win64.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}