@{
    ListVersions = {
        Get-GitHubRelease Wilfred/difftastic `
            | ? Version -notin "0.26.1", "0.26.2", "0.36.0" `
            | Get-GitHubAsset difft-x86_64-pc-windows-msvc.zip
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}