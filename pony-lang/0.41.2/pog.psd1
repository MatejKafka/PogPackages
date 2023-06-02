@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.41.2"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "450d89d8a36e1384a4732570d9acc297e708e72f819213a7c59d55f9ba0afc76"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}