@{
    ListVersions = {
        Get-GitHubRelease ooni/probe-cli `
            | ? Version -ge "3.11.0-beta.2" `
            | ? Version -notin "3.18.0-alpha", "3.16.0-alpha", "3.12.0-alpha.3" `
            | Get-GitHubAsset "ooniprobe-windows-amd64.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
        }
    }
}