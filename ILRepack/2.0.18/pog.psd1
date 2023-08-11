@{
	Name = 'ILRepack'
	Architecture = 'x64'
	Version = '2.0.18'

	Website = "https://github.com/gluck/il-repack"

	Install = @{
		Url = {"https://www.nuget.org/api/v2/package/ILRepack/$($this.Version)"}
		Hash = "082620AC829291247B418E317F155FB914632251E644383822D6DFECD0837050"
		Subdirectory = "tools"
	}

	Enable = {
		Export-Command "ILRepack" "./app/ILRepack.exe" -Symlink
	}
}