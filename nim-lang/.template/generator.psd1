@{
	ListVersions = {
		# skip versions before 1.0.0; also skip 1.0.0 and 1.0.2, which do not support --clearNimblePath
		Get-GitHubRelease -Tags nim-lang/Nim | ? {$_.Version -ge "1.0.0" -and $_.TagName -notin "v1.0.0", "v1.0.2"}
	}

	Generate = {
		return [ordered]@{
			Version = $_.Version
			Hash = Get-HashFromChecksumFile "https://nim-lang.org/download/nim-$($_.Version)_x64.zip.sha256" "nim-$($_.Version)_x64.zip"
		}
	}
}