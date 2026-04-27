@{
	ListVersions = {
		Get-GitHubRelease crazy-max/WindowsSpyBlocker `
			| Get-GitHubAsset "WindowsSpyBlocker.exe"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
