@{
	Name = "pony-lang"
	Architecture = "x64"
	Version = "0.40.0"

	Install = @{
		Url = {"https://dl.cloudsmith.io/public/ponylang/releases/raw/versions/$($this.Version)/ponyc-x86-64-pc-windows-msvc.zip"}
		Hash = "3338c1ef51f29741fa77e9a30a17e90a8fc557ca78e3203858674ba2423a68bb"
	}

	Enable = {
		Export-Command "ponyc" "./app/bin/ponyc.exe"
	}
}