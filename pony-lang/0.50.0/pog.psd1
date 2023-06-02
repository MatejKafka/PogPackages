@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.50.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "f2c675e0d772b1b6b1f8eb7cb4ad472cd505999c59d9fb865d0396d54b7bbe07"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}