@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.45.2"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "9623408cd8d4ec64237e003195e58ff57abb481c90258335212039a1958323c2"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}