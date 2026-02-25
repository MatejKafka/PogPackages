@{
    ListVersions = {
        Get-GitHubRelease mstange/samply -TagPrefix samply-v `
            | ? Version -ge "0.12.0" `
            | Get-GitHubAsset "samply-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}