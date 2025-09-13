@{
    ListVersions = {
        Get-GithubRelease ast-grep/ast-grep `
            | ? Version -gt 0.14.0 `
            | Get-GitHubAsset "*-x86_64-pc-windows-msvc.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = if ($_.Asset.Hash) {$_.Asset.Hash} else {Get-UrlHash $_.Asset.Url}
        }
    }
}