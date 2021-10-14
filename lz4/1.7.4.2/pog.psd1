@{
	Name = "lz4"
	Architecture = "x64"
	Version = "1.7.4.2"

	Install = @{
		Url = "https://github.com/lz4/lz4/releases/download/v1.7.4.2/lz4_v1_7_4_win64.zip"
		Hash = "7149773A9940391AC6A6FB9DFA2BFA05806C5886CCDC34CC93912C8C687E0DCA"
	}

	Enable = {
		Export-Command "lz4" "./app/lz4.exe"
	}
}