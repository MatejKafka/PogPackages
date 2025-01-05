@{
    ListVersions = {
        # earlier versions do not support portable mode
        Get-GitHubRelease 8051Enthusiast/biodiff `
            | ? Version -ge "1.0.3" `
            | Get-GitHubAsset "biodiff-windows-*.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}