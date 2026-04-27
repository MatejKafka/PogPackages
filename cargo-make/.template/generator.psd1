@{
	ListVersions = {
		Get-GitHubRelease sagiegurari/cargo-make `
			| ? Version -notin "0.16.5", "0.35.14" <# missing assets #> `
			| Get-GitHubAsset "cargo-make-v*-x86_64-pc-windows-msvc.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
