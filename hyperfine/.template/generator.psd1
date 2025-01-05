@{
    ListVersions = {
        Get-GitHubRelease sharkdp/hyperfine `
            | ? Version -ge "1.3.0" `
            | Get-GitHubAsset "hyperfine-v*-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}