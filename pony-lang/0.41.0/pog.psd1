@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.41.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "ce1cd6ebf152f76b1affb9b840855ebaf2c8110a278650f99c8ced0781b72340"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}