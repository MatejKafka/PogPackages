# TODO: when writing the generator, test which versions support the --settings parameter, it's pretty new and at the beginning, it was pretty wonky
@{
	Name = 'DB Browser for SQLite'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Website = 'https://sqlitebrowser.org/'
	Description = 'DB Browser for SQLite (DB4S) is a high quality, visual, open source tool to create, design, and edit database files compatible with SQLite.'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		# do not create the `db4s.ini` file; the settings loader in sqlitebrowser is a bit stupid and if the file is empty, it will ignore it
		New-Directory "./config"

		Export-Shortcut "DB Browser for SQLite" "./app/DB Browser for SQLite.exe" -Arguments "--settings", "./config/db4s.ini"
	}
}
