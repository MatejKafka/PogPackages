@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.35.1"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "261c6e14f33d983e2fd79a533ef9e4ce156dd0b7eeebea401424da8ef52667ab"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe" -NoSymlink
	}
}