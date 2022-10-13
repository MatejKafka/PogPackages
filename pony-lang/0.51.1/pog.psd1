@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.51.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "3e7b9fda343501884aedb08b354e9c17072c69f0ade7650230c22c4cc77a0985"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}