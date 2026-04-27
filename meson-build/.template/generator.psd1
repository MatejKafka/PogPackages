@{
	ListVersions = {
		Get-GitHubRelease mesonbuild/meson -TagPrefix "" `
			| ? Version -ge "0.29.0" <# older releases don't have a tar.gz asset #> `
			| ? Version -ne "0.30.0" <# no tar.gz asset #> `
			| Get-GitHubAsset "meson-*.tar.gz"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
