@{
    ListVersions = {
        Get-GitHubRelease mcmilk/7-Zip-zstd `
            | Get-GitHubAsset "7z*-zstd-x64.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}