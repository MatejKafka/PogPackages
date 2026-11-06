@{
	ListVersions = {
		Get-GitHubRelease horsicq/DIE-engine `
			| ? Version -ge "3.01b" <# older releases have no portable win64 asset #> `
			| Get-GitHubAsset -Regex "die_win64_(portable_)?[0-9\.]+.*\.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
