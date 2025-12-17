@{
    ListVersions = {
        Get-GitHubRelease telegramdesktop/tdesktop `
            | ? Version -gt 2.5.6 `
            | ? Version -notin $this._SkippedVersions `
            | Get-GitHubAsset tportable-x64.*.zip
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }

    _SkippedVersions = @(
        "6.3.8"
        "5.7.3", "5.3.2", "5.2.6", "5.0.5"
        "4.16.4", "4.15.7", "4.14.15", "4.14.14", "4.11.8", "4.10.3", "4.10.1", "4.9.3", "4.8.12", "4.8.6", "4.8.4", "4.3.4"
        "3.5.2", "3.4.6", "3.2.4", "3.2.3", "3.2.1", "3.1.10", "3.1.9", "3.0.3"
        "2.9.12", "2.9.11", "2.9.10", "2.9.8", "2.9.7", "2.9.6", "2.9.3", "2.8.3", "2.8.2", "2.7.9", "2.6.5"
    )
}