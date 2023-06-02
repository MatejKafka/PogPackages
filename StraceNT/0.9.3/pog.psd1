@{
	Name = "StraceNT"
	Architecture = "x86"
	Version = "0.9.3"

	Description = "Strace for Windows. NOTE: Works only for 32 bit (x86) binaries. https://github.com/ipankajg/stracent"

	Install = @{
		Url = {"https://github.com/ipankajg/stracent/releases/download/v$($this.Version)/stracent.zip"}
		Hash = "ABFF1AF6499D03B81027D8ECD8A5FD6ACAB90E6E22DA90CCCB33295E4D1C3B28"
	}

	Enable = {
		Write-Warning "StraceNT writes to registry (HKCU\Software\IntellectualHeaven\StraceNT)."
		Export-Command "stracent" "./app/stracent.exe" -Symlink
		Export-Shortcut "StractNT" "./app/straceui.exe"
	}
}
