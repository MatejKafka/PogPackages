@{
    ListVersions = {
        Get-GitHubRelease ccache/ccache `
            | ? Version -gt "3.7.8" `
            | Get-GitHubAsset "ccache-*-windows-*64.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}