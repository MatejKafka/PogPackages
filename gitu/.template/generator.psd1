@{
	ListVersions = {
		Get-GitHubRelease altsem/gitu `
			| ? Version -ge "0.18.2" <# older releases don't support windows #> `
			| Get-GitHubAsset "gitu-v*-x86_64-pc-windows-msvc.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
