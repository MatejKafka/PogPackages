@{
    ListVersions = {
        Get-GitHubRelease ClementTsang/bottom `
            | ? Version -gt 0.2.0 `
            | Get-GitHubAsset "bottom_x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}