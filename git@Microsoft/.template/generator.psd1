@{
    ListVersions = {
        Get-GitHubRelease microsoft/git | Get-GitHubAsset "PortableGit-*-64-bit.7z.exe" -IgnoreMissing
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}