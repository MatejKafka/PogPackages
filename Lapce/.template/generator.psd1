@{
	ListVersions = {
		Get-GitHubRelease lapce/lapce `
			| ? Version -ge "0.0.11" <# older releases don't support windows #> `
			| Get-GitHubAsset "Lapce-windows-portable.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
