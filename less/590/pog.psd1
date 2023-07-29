@{
	Name = "less"
	Architecture = "x64"
	Version = "590"
	
	Install = @{
		Url = {"https://github.com/jftuga/less-Windows/releases/download/less-v$($this.Version)/less.exe"}
		Hash = "1532A37CB2B143447939B4ACAE1728AA2D84DF66B1DE3AA0EB9D8F035FA43182"
		NoArchive = $true
		Target = "less.exe"
	}
	
	Enable = {
		Export-Command "less" "./app/less.exe" -Symlink
	}
}
