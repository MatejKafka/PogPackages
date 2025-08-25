@{
    ListVersions = {
        Get-GitHubRelease mikefarah/yq | Get-GitHubAsset -Regex "(yq|yaml)_windows_amd64.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}