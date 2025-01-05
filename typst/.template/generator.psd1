@{
    ListVersions = {
        Get-GitHubRelease typst/typst `
            | ? TagName -notlike "v23-03-*" `
            | Get-GitHubAsset "typst-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}