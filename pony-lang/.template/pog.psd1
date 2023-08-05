@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}