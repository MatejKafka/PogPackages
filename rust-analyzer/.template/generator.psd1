@{
    ListVersions = {
        Get-GitHubRelease rust-lang/rust-analyzer -Version {if ($_.TagName -ne "nightly") {$_.TagName.Replace("-", ".")}} `
            | ? Version -ge "2023.01.09" `
            | Get-GitHubAsset "rust-analyzer-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}