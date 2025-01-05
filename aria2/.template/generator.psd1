@{
    ListVersions = {
        # sometimes there's a build1 and build2, always take build1 to be reproducible
        Get-GitHubRelease aria2/aria2 -TagPrefix "release-" `
            | ? TagName -notin "release-1.23.0" `
            | Get-GitHubAsset "aria2-*-win-64bit-build1.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}