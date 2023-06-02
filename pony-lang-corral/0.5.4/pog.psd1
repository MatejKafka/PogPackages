@{
	Name = "pony-lang-corral"
	Architecture = "x64"
	Version = "0.5.4"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/corral-x86-64-pc-windows-msvc.zip"}
		Hash = "6d335641e204edabe894620d243fe9af140f63c1a2a6c0b1d8b8a99d06b15425"
	}

	Enable = {
		Export-Command "corral" "./app/corral.exe" -Symlink
	}
}
