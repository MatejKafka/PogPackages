@{
	ListVersions = {
		Get-GitHubRelease pit-ray/win-vind `
			| ? Version -ge "3.0.1" <# older releases don't have a 64bit zip #> `
            | Get-GitHubAsset -Regex "win-vind_.*_64bit(_portable)?.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
