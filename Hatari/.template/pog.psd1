@{
	Name = 'Hatari'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Description = "The Atari ST, STE, TT and Falcon emulator."
	Website = "https://hatari.tuxfamily.org/"

	Install = @{
		Url = {$V = $this.Version; "https://download.tuxfamily.org/hatari/${V}/hatari-${V}_windows64.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		# https://github.com/hatari/hatari/blob/2c6804e3f419d492044a3d572c28108678f7b21a/src/paths.c#L256
		New-Directory "./data/.hatari"

		# hatari.exe has GUI subsystem, so no CLI output is visible; the issue is not specific to Pog
		# ReplaceArgv0 is necessary, Hatari loads `tos.img` from app dir based on argv[0]
		Export-Command "hatari" "./app/hatari.exe" -Environment @{HOME = "./data"} -ReplaceArgv0
		Export-Shortcut "Hatari" "./app/hatari.exe" -Environment @{HOME = "./data"}
	}
}