@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.45.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "fa7828ef0fc3d192bd670f22471fd8d7b0db5be365e96eccc324572b2c43c1c8"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}