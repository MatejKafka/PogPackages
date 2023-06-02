@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.38.2"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "51c10b44448e372ec050db3d4142bb6e1e460cc8da3c54d1037761cfe710cea1"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}