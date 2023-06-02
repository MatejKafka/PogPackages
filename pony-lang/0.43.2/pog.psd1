@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.43.2"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "e5b6b291626c38a9c814b294f101df113ad22ae5c6ab6c8d054fb180af2b7488"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}