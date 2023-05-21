@{
	Name = 'curl'
	Architecture = 'x64'
	Version = '7.88.1_2'

	Install = @{
		Url = {$V = $this.Version; "https://curl.se/windows/dl-${V}/curl-${V}-win64-mingw.zip"}
		Hash = "D5665CC01F7826379A447AA057812DE40D84D2D4FA035F8C3706568950522A68"
	}

	Enable = {
		# FIXME: Pog only adds its bin directory into user-level PATH, so the systemwide curl.exe installation always has precedence
		Export-Command curl "./app/bin/curl.exe" -Symlink
	}
}
