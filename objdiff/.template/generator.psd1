@{
    ListVersions = {
        # CLI was added in v2.0.0-alpha.1
        Get-GitHubRelease encounter/objdiff `
            | ? Version -ge 2.0.0-alpha.1 `
            | Get-GitHubAsset "objdiff-windows-x86_64.exe", "objdiff-cli-windows-x86_64.exe"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version

            UrlGui = $_.Asset[0].Url
            UrlCli = $_.Asset[1].Url

            HashGui = Get-UrlHash $_.Asset[0].Url
            HashCli = Get-UrlHash $_.Asset[1].Url
        }
    }
}