@{
	ListVersions = {
		Get-GitHubRelease cvut/qtrvsim `
			| Get-GitHubAsset "qtrvsim-mingw32-*.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
