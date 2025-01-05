@{
    ListVersions = {
        Get-GitHubRelease mozilla/sccache `
            | ? Version -ge "0.3.1" `
            | Get-GitHubAsset "sccache-*-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}