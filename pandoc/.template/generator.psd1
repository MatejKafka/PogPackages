@{
    ListVersions = {
        Get-GitHubRelease jgm/pandoc | ? Version -ge "2.2" | Get-GitHubAsset "pandoc-*-windows-x86_64.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}