@{
	Name = 'steghide'
	Architecture = 'x64'
	Version = '0.5.1'

	Install = @{
		Url = "https://sourceforge.net/projects/steghide/files/steghide/0.5.1/steghide-0.5.1-win32.zip/download"
		Hash = "D8211B43DC4DAD1333C9AC8B60F5A468F5F8D744F80F9571DF431DEF925CD579"
		UserAgent = "Wget"
	}

	Enable = {
		Export-Command "steghide" "./app/steghide.exe"
	}
}