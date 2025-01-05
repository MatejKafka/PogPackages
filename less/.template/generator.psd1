@{
    ListVersions = {
        Get-GitHubRelease jftuga/less-Windows -TagPrefix "less-v" `
            | ? Version -ge "608" `
            | Get-GitHubAsset "less-x64.zip"

    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}