@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.55.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "edec0d05b19586a09a9e97f8e3cd066718f380dfef2920c8edb5d64eea51904e"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}