@{
    ListVersions = {
        Get-GitHubRelease alacritty/alacritty `
            | ? TagName -notin "v0.12.1-rc2", "v0.12.1-rc1", "v0.12.0-rc3" `
            | ? Version -gt "0.5.0" `
            | Get-GitHubAsset "Alacritty-v*-portable.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}