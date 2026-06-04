@{
    ListVersions = {
        Get-GitHubRelease winsiderss/si-builds `
            | ? Version -ge "3.0.5706" <# earlier versions have a differently named subdir #> `
            | Get-GitHubAsset -Regex "systeminformer-([0-9\.]+|build)-(release-)?bin.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}