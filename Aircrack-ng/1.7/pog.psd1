@{
	Name = 'Aircrack-ng'
	Architecture = 'x64'
	Version = '1.7'

	Install = @{
		Url = "https://download.aircrack-ng.org/aircrack-ng-1.7-win.zip"
		Hash = "767A456BF0675032D37D3C8CAF05E2E5DCB105C218614B2E4E42B51370D05205"
		Subdirectory = "*/bin"
	}

	Enable = {
		Export-Shortcut "Aircrack-ng" "./app/Aircrack-ng GUI.exe"
		ls ./app/*.exe -File | ? Name -ne "Aircrack-ng GUI.exe" | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_) -NoSymlink
		}
	}
}
