@{
	ListVersions = {
		Get-GitHubRelease jellyfin/jellyfin-ffmpeg `
			| ? Version -ge "4.4.1-2" `
			| % {
				# switchover from dynamically linked versions to statically linked
				$Pattern = if ($_.Version -ge "7.1.1-5") {"jellyfin-ffmpeg_*_portable_win64-clang-gpl.zip"} else {"jellyfin-ffmpeg_*_win64.zip"}
				$_ | Get-GitHubAsset $Pattern -Optional "$Pattern.sha256sum"
			}
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Url = $_.Asset.Url
            Hash = Get-GithubAssetHash $_.Asset $_.OptionalAsset
		}
	}
}
