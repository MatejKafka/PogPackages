@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.54.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "0a8b9084c216055fada12c8e322d537c8cf0dc8dcaf2213f142a4d0d8f4dce72"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}