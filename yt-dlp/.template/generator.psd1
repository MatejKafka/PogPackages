@{
    ListVersions = {
        # before version 2021.02.24, the binary is called youtube-dlc.exe
        # before version 2021.10.22, the archive name is yt-dlp.zip (and sometime between these two, the archive is added)
        # afterwards, the archive is called yt-dlp_win.zip
        # did not check when support for the portable CLI flags/env was added
        Get-GitHubRelease yt-dlp/yt-dlp `
            | ? Version -ge 2021.10.22
            | Get-GitHubAsset yt-dlp_win.zip -Optional SHA2-256SUMS
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset[0].Url
            Hash = Get-GitHubAssetHash $_.Asset $_.OptionalAsset
        }
    }
}