@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.52.3"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "ecce307035a660942c98873b34a3c4baadcab6bffaad4e47d312aeb21d55f130"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}