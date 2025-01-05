@{
    ListVersions = {
        Get-GitHubRelease martinvonz/jj `
            | ? TagName -notin "v0.3.0", "v0.3.1", "v0.3.2", "v0.3.3", "v0.5.0" `
            | Get-GitHubAsset "jj-v*-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}