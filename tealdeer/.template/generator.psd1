@{
    ListVersions = {
        Get-GitHubRelease tealdeer-rs/tealdeer `
            | ? Version -ge "1.6.0" `
            | ? Version -notin "1.7.3", "1.6.2" `
            | Get-GitHubAsset "tealdeer-windows-x86_64-msvc.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}