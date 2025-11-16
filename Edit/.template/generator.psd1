@{
    ListVersions = {
        Get-GitHubRelease microsoft/edit | Get-GitHubAsset "edit-*-x86_64-windows.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}