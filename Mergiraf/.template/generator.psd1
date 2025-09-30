@{
    ListVersions = {
        Get-GitHubRelease -Codeberg mergiraf/mergiraf | Get-GitHubAsset "mergiraf_x86_64-pc-windows-gnu.zip"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}