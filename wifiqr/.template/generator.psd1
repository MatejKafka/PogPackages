@{
	ListVersions = {
		Get-GitHubRelease reugn/wifiqr `
			| ? Version -ge "0.2.2" <# older releases don't support windows #> `
			| Get-GitHubAsset "wifiqr_*_windows_x86_64.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
