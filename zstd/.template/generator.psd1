@{
    ListVersions = {
        Get-GitHubRelease facebook/zstd `
            | ? {$_.tag_name.StartsWith("v")} `
            | % {
                $Asset = $_.assets | ? browser_download_url -like "*zstd-v*-win64.zip"
                if ($Asset) {
                    return @{
                        Version = $_.tag_name.Substring(1)
                        Url = $Asset.browser_download_url
                    }
                }
            }
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Url
            Hash = Get-UrlHash $_.Url
        }
    }
}