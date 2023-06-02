@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.43.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "57bf94545361831cdeb2d0aa3d89f346f1913747f7c042fcadb70ce5bdc232e0"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}