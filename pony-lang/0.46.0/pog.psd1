@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.46.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "8b082eeaf26ef5438bb49ae65943a3adb5c8555384f1afb141807918f0e8557d"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}