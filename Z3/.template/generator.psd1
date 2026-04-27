@{
	ListVersions = {
		Get-GitHubRelease Z3Prover/z3 -TagPrefix "z3-" `
			| Get-GitHubAsset "z3-*-x64-win.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
