@{
    ListVersions = {
        Get-GitHubRelease KirillOsenkov/MSBuildStructuredLog `
            | ? Version -ge 2.3.42 <# older versions don't support portable data dir #> `
            | Get-GitHubAsset "MSBuildStructuredLogViewer-*-full.nupkg"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}