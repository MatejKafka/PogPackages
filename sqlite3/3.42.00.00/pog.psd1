@{
	Name = 'sqlite3'
	Architecture = 'x64'
	Version = '3.42.00.00'

	Install = @{
		Url = "https://www.sqlite.org/2023/sqlite-tools-win32-x86-3420000.zip"
		Hash = "5321C55BFB548CA1B27A972F3ECFD8269B0C8CE0BCBEAC2F9D43162A4BB89710"
	}

	Enable = {
		Export-Command "sqlite3" "./app/sqlite3.exe" -Symlink
		Export-Command "sqlite3_analyzer" "./app/sqlite3_analyzer.exe" -Symlink
		Export-Command "sqldiff" "./app/sqldiff.exe" -Symlink
	}
}
