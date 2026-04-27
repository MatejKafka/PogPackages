@{
	ListVersions = {
        # both git nightlies (e.g., "2026-01-01-git-162ad61486") and versioned releases (`8.0`) are published
        #  from this repository, skip git nightlies; some of the nightly releases have a numeric git hash that
        #  trips up older Pog versions, so we filter them out with -Version
		Get-GitHubRelease GyanD/codexffmpeg -Version {if ($_.TagName -match "^[0-9.]+$") {$_.TagName}} `
			| Get-GitHubAsset "ffmpeg-*-full_build.7z"
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset
		}
	}
}
