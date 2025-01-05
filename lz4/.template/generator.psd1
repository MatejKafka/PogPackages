@{
	ListVersions = {
		Get-GitHubRelease lz4/lz4 | Get-GitHubAsset "*win64*"
	}

    Generate = {
        return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
    }
}