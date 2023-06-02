@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.34.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "b1a5ae438fee0e3803133261d8467bc85a3cdf70d61001fced82cbc51943fa1c"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}