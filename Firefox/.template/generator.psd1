@{
	ListVersions = {
		Invoke-WebRequest "https://releases.mozilla.org/pub/firefox/releases/" `
			| % Links `
			| % {if ($_.href -match "^/pub/firefox/releases/([0-9.]+.*)/$") {$Matches[1]}} `
			| ? {$_ -match "^[0-9.]+(b[0-9]*)?$"} <# filter out ESR, funnelcake and similar extra versions #> `
			| ? {[int]($_ -split "\.")[0] -ge 67}

		#    /\ filter out versions earlier than 67, some required features are not supported (also, versions before 53
		#       don't have a precomputed SHA-256 hash, only SHA-512, and versions before 42 do not have an x64 build)

		# WIP: Nightly versions
		# Invoke-WebRequest "https://releases.mozilla.org/pub/firefox/nightly/" `
		#     | % Links `
		#     | ? {$_.href -match "^/pub/firefox/nightly/([0-9]{4})/$" -and [int]$Matches[1] -ge 2018} `
		#     | % {Invoke-WebRequest "https://releases.mozilla.org$($_.href)"} `
		#     | % Links `
		#     | ? href -match "^/pub/firefox/nightly/[0-9]{4}/[0-9]{2}/$" `
		#     | % {Invoke-WebRequest "https://releases.mozilla.org$($_.href)"} `
		#     | % Links
		#     | ? href -match "^/pub/firefox/nightly/[0-9]{4}/[0-9]{2}/[0-9-]+-mozilla-central/$"
	}

	Generate = {
		param($Version)

		return [ordered]@{
			Version = $Version
			Hash = Get-HashFromChecksumFile `
				"https://releases.mozilla.org/pub/firefox/releases/$Version/SHA256SUMS" `
				"win64/en-US/Firefox Setup $Version.exe"
		}
	}
}