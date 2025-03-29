@{
    ListVersions = {
        # newer releases are also published on GitHub
        Get-GitHubRelease ip7z/7zip | % Version
    }

    Generate = {
        return [ordered]@{
            Version = $_
            Hash = Get-UrlHash "https://www.7-zip.org/a/7z$($_ -replace '\.', '')-x64.exe"
        }
    }
}