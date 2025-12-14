@{
    ListVersions = {
        Get-GitHubRelease quincy-rs/quincy `
            | ? Version -ge "0.3.1" `
            | ? Version -ne "1.0.0-beta.4" `
            | Get-GitHubAsset "quincy-*windows-x86_64.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GitHubAssetHash $_.Asset
        }
    }
}