@{
    ListVersions = {
        Get-GitHubRelease thebookisclosed/ViVe `
            | Get-GitHubAsset -Regex "ViVeTool-v[0-9\.]+(-IntelAmd)?\.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GitHubAssetHash $_.Asset
        }
    }
}