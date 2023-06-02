@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.38.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "4eab1efd45746b6f7ba963afa81a8362eba06419a6c99b12181dc4364e223a36"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}