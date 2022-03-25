@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.48.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "66f3073583303b8c1c63214509a7b8dbbc8bb38a56026b2bcc9958dd0c1f8d24"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}