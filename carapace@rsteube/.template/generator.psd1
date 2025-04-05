@{
    ListVersions = {
        Get-GitHubRelease carapace-sh/carapace-bin `
            | ? Version -gt "0.18.1" `
            | Get-GitHubAsset "carapace-bin_*windows_amd64.*" -Optional "checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset $_.OptionalAsset
        }
    }
}