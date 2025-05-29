@{
    ListVersions = {
        Get-GitHubRelease pbatard/rufus `
            | ? Version -ge "2.0" `
            | ? Version -notin "4.7_BETA", "4.8_BETA" `
            | Get-GitHubAsset rufus-*p.exe
    }

    Generate = {
        [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}