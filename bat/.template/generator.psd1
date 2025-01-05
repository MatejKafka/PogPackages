@{
    ListVersions = {
        Get-GitHubRelease sharkdp/bat `
            | ? Version -gt "0.6.0" `
            | Get-GitHubAsset "bat-v*-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}