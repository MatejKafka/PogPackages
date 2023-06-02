@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.51.3"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "336ff3612ae3944a30a7857da056dca26409470f107125e868c28ae300c1987f"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}