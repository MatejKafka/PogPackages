@{
	ListVersions = {
		Get-GitHubRelease Stirling-Tools/Stirling-PDF `
			| ? Version -notin "0.3.0", "0.10.2" <# renamed jar asset #> `
			| Get-GitHubAsset "Stirling-PDF.jar"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
