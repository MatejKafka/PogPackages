@{
    ListVersions = {
        Get-GitHubRelease dandavison/delta `
            | ? Version -gt "0.2.0" `
            | Get-GitHubAsset "delta-*-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}