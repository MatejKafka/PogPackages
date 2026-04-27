@{
	ListVersions = {
        Get-GitHubRelease mandiant/GoReSym `
            | ? Version -ge "2.7.4" `
            | Get-GitHubAsset "GoReSym-windows.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
