@{
	Name = 'VBinDiff'
	Architecture = 'x64'
	Version = '3.0_beta5'

	Install = @{
		Url = {"https://www.cjmweb.net/vbindiff/VBinDiff-$($this.Version).zip"}
		Hash = "05E52B50D9101F9903CC1342FCC307EACF70485E8D942D43C7A440648C9C3A7F"
	}

	Enable = {
		Export-Command "VBinDiff" "./app/VBinDiff.exe" -Symlink
	}
}