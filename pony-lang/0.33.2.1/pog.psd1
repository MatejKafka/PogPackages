@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.33.2.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "64ef6c96486a89992e5f334dc2fa56b13f684a15964baf7780f00c2e9d3eb91f"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}