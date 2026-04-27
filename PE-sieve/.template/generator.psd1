@{
	ListVersions = {
        Get-GitHubRelease hasherezade/pe-sieve `
            | ? Version -ge "0.1.6" `
            | Get-GitHubAsset "pe-sieve64.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
