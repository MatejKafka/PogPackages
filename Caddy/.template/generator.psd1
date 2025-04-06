@{
    ListVersions = {
        Get-GitHubRelease caddyserver/caddy `
            | ? Version -ge "2.0.0" `
            | Get-GitHubAsset "caddy_*_windows_amd64.zip"
    }

    Generate = {
        [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            # Caddy only provides SHA-512
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}