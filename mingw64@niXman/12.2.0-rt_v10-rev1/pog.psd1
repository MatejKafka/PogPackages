@{
	Name = "mingw64@niXman"
	Architecture = "x64"
	Version = "12.2.0-rt_v10-rev1"
	
	Install = @{
		Url = "https://github.com/niXman/mingw-builds-binaries/releases/download/12.2.0-rt_v10-rev1/x86_64-12.2.0-release-win32-seh-rt_v10-rev1.7z"
		Hash = "774916C4403C5219F8AF3A3EE3012DE6C017C034895C2C92BC4DE99895C2C924"
	}
	
	Enable = {
		foreach ($c in (ls "./app/bin" -Filter *.exe)) {
			Export-Command $c.BaseName "./app/bin/$($c.Name)" -ReplaceArgv0
		}
	}
}
