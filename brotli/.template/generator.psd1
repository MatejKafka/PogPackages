@{
    ListVersions = {
        Get-GitHubRelease google/brotli `
            | ? Version -ge "1.1.0rc" `
            | Get-GitHubAsset "brotli-x64-windows-static.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}