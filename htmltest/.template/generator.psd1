@{
    ListVersions = {
        Get-GithubRelease wjdp/htmltest `
            | ? Version -ge "0.9.1-rc1" `
            | Get-GitHubAsset "htmltest_*_windows_amd64.zip" -Optional "htmltest_*_checksums.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset $_.OptionalAsset
        }
    }
}