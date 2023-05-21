@{
	Name = 'just'
	Architecture = 'x64'
	Version = '1.13.0'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/casey/just/releases/download/${V}/just-${V}-x86_64-pc-windows-msvc.zip"}
		Hash = "CBB956C59B3B2D48011630FED626F13340B5692ABA45833301BDF696DCCB51C8"
	}

	Enable = {
		Export-Command "just" "./app/just.exe" -Symlink
	}
}
