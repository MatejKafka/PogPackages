@{
    ListVersions = {
        Get-GitHubRelease WinMTR/WinMTR-Official | Get-GitHubAsset "WinMTR-*.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}