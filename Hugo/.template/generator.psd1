@{
    ListVersions = {
        Get-GitHubRelease gohugoio/hugo `
            | ? Version -ge 0.43 `
            <# Hugo has two editions: standard and extended; extended is only slightly larger #> `
            | Get-GitHubAsset -Regex "hugo_extended_[0-9.]+_[wW]indows-(amd64|64bit)\.zip" -Optional "hugo_[0-9.]+_checksums\.txt"
    }

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = if ($_.Version -gt "0.55.6") {
                Get-HashFromChecksumFile $_.OptionalAsset.Url $_.Asset.Name
            } else {
                # older versions have a separate checksums file for standard and extended edition binaries
                Get-UrlHash $_.Asset.Url
            }
        }
    }
}