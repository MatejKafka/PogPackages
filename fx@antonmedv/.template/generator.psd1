@{
    ListVersions = {
        # older versions were not written in Go yet, have a different archive format
        Get-GitHubRelease antonmedv/fx `
            | ? Version -ge 21.0.0 `
            | Get-GitHubAsset fx_windows_amd64.exe
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}