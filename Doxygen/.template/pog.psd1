@{
	Name = 'Doxygen'
	Architecture = 'x64'
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = {"https://www.doxygen.nl/files/doxygen-$($this.Version).windows.x64.bin.zip"}
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		Export-Command "doxygen" "./app/doxygen.exe"
		Export-Command "doxyindexer" "./app/doxyindexer.exe"
		Export-Command "doxysearch" "./app/doxysearch.cgi.exe"
		Export-Command "doxywizard" "./app/doxywizard.exe"
	}
}