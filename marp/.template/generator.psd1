@{
    ListVersions = {
        Get-GitHubRelease marp-team/marp-cli `
            | ? Version -ge "0.9.1" `
            | Get-GitHubAsset "marp-cli-v*-win.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}
