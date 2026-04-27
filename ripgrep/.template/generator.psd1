@{
	ListVersions = {
        Get-GitHubRelease BurntSushi/ripgrep `
            | ? Version -ge "0.1.13" `
            | Get-GitHubAsset "ripgrep-*-x86_64-pc-windows-msvc.zip"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
			Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
