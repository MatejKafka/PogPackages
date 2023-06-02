@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.51.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "798325dd8a6238c04c4a2d77f270751e4bd6273bebc411213a44d236d87af2ae"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}