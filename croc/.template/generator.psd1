@{
	ListVersions = {
        Get-GitHubRelease schollz/croc `
            | ? Version -ge "9.0.0" <# older releases don't support CROC_CONFIG_DIR #> `
            | Get-GitHubAsset "croc_*_Windows-64bit.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
