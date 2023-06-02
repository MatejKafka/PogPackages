@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.36.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "24554fc694801da43bfbf46e770445f1d4b6ec7fd7d9e0cb3f0ed8059a4c49e9"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}