@{
    ListVersions = {
        Get-GitHubRelease devolutions/unigetui `
            | ? Version -ge "2026.3.0" <# first version that supports portable mode #> `
            | Get-GitHubAsset UniGetUI.x64.zip
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}