@{
	ListVersions = {
		Get-GitHubRelease dmester/pdftosvg.net -TagPrefix "" `
			| ? Version -ne "0.2.0" <# no exe asset #> `
			| Get-GitHubAsset "pdftosvg.exe"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
