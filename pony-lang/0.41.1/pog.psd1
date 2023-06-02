@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.41.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "bd1ac6ec733d100163c5eae9c718c90ad12480b2b844e6941b6bf0ac4d6e3bb8"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}