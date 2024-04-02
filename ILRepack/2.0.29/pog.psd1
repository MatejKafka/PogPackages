@{
	Name = 'ILRepack'
	Architecture = 'x64'
	Version = '2.0.29'

	Website = "https://github.com/gluck/il-repack"

	Install = @{
		Url = {"https://www.nuget.org/api/v2/package/ILRepack/$($this.Version)"}
		Hash = "07FD014A1AE057FC20B048DB588B07DCD2D176D3884CA9B1CABB1278DCE40D09"
		Subdirectory = "tools"
	}

	Enable = {
		Export-Command "ILRepack" "./app/ILRepack.exe" -Symlink
	}
}