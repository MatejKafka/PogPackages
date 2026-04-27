@{
	ListVersions = {
		Get-GitHubRelease neovim/neovim `
			| ? Version -notin "0.3.6", "0.4.0" `
			| Get-GitHubAsset "nvim-win64.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
