@{
    ListVersions = {
        Get-GitHubRelease cli/cli `
            | ? Version -ge "0.5.3" <# older versions use .msi instead of .zip #> `
            | Get-GitHubAsset "gh_*_windows_amd64.zip" -Optional "gh_*_checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset $_.OptionalAsset
        }
    }
}
