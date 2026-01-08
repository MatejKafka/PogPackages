@{
    ListVersions = {
        Get-GitHubRelease helix-editor/helix | Get-GitHubAsset "helix-*-x86_64-windows.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}