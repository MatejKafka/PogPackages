@{
    ListVersions = {
        # CLI was added in v2.0.0-alpha.1
        Get-GitHubRelease encounter/objdiff `
            | ? Version -ge 2.0.0-alpha.1 `
            | Get-GitHubAsset "objdiff-cli-windows-x86_64.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = if ($_.Asset.Hash) {$_.Asset.Hash} else {Get-UrlHash $_.Asset.Url}
        }
    }
}