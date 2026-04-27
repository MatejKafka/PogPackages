@{
	ListVersions = {
		Get-GitHubRelease horsicq/DIE-engine `
			| ? Version -ge "3.01b" <# older releases have no portable win64 asset #> `
			| Get-GitHubAsset "die_win64_portable_*.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
