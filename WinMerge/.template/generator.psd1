@{
    ListVersions = {
        Get-GitHubRelease WinMerge/winmerge | Get-GithubAsset "winmerge-*-x64-exe.zip"
    }

    Generate = {
        [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}