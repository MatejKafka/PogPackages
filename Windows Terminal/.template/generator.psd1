@{
	ListVersions = {
		Get-GitHubRelease microsoft/terminal `
			| ? {$_.Version -ge "1.17.11391.0" -and $_.TagName -notin "1904.29002", "1810.02002", "1708.14008"} `
			| Get-GitHubAsset "*_x64.zip"
	}

	Generate = {
		return [ordered]@{
            Version = $_.Version
            Url = $_.Asset.Url
            Hash = Get-UrlHash $_.Asset.Url
        }
	}
}