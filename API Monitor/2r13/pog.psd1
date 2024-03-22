@{
	Name = "API Monitor"
	Architecture = "x64", "x86"
	Version = "2r13"

	Install = @{
		Url = "http://www.rohitab.com/site/files/downloads/2013/03/api-monitor-v2r13-x86-x64.zip"
		Hash = "D045E45F523A6C0C7A2A8E06831F4B2D705FB84F4995791B5A70B28424A49D2B"
	}

	Enable = {
		Set-SymlinkedPath "./app/Settings.ini" "./config/Settings.ini" File
		Set-SymlinkedPath "./app/Filters.xml" "./config/Filters.xml" File

		Export-Shortcut "API Monitor" "./app/apimonitor-x64.exe"
		Export-Shortcut "API Monitor (x86)" "./app/apimonitor-x86.exe"
	}
}