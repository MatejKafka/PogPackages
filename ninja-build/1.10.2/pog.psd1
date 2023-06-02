@{
	Name = "ninja-build"
	Architecture = "x64"
	Version = "1.10.2"
	
	Install = @{
		Url = {"https://github.com/ninja-build/ninja/releases/download/v$($this.Version)/ninja-win.zip"}
		Hash = "BBDE850D247D2737C5764C927D1071CBB1F1957DCABDA4A130FA8547C12C695F"
	}
	
	Enable = {
		Export-Command "ninja" "./app/ninja.exe" -Symlink
	}
}
