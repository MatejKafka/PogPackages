@{
	ListVersions = {
        Invoke-WebRequest "https://archive.torproject.org/tor-package-archive/torbrowser/" `
			| % Links `
			| ? href -match "^([0-9]+\.[0-9]+(?:\.[0-9]+)?(?:a[0-9]+)?)/$" `
            | % {$Matches[1]} `
            | ? {[int]($_ -split "\.")[0] -ge 12} `
            | ? {$_ -notin "14.5.9", "13.5.8", "13.0.3", "13.0.2"} `
            | ? {$_ -notlike "13.0a*" -and $_ -notlike "12.0a*"}

	}

	Generate = {
		$Base = "https://archive.torproject.org/tor-package-archive/torbrowser/$_"
        $Filename = if ($_ -like "12.*") {
            "torbrowser-install-win64-${_}_ALL.exe"
        } else {
            "tor-browser-windows-x86_64-portable-$_.exe"
        }

        return [ordered]@{
			Version = $_
			Url = "$Base/$Filename"
			Hash = Get-HashFromChecksumFile "$Base/sha256sums-signed-build.txt" $Filename
		}
	}
}
