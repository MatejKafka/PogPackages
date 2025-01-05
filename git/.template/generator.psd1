@{
    ListVersions = {
        # Git uses versions suffixed by .windows.[0-9], where the second number is a Windows-specific patch version
        Get-GitHubRelease git-for-windows/git `
            | ? TagName -match '^v(.*)\.windows\.\d+$' `
            | Get-GitHubAsset "PortableGit-*-64-bit.7z.exe" -IgnoreMissing
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}