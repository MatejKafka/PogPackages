@{
	Name = 'Error Lookup Tool'
	Architecture = 'x64'
	Version = '6.4.5'

	Install = @{
		Url = "https://download.microsoft.com/download/4/3/2/432140e8-fb6c-4145-8192-25242838c542/Err_6.4.5/Err_6.4.5.exe"
		Hash = "88739EC82BA16A0B4A3C83C1DD2FCA6336AD8E2A1E5F1238C085B1E86AB8834A"
		NoArchive = $true
		Target = "Err.exe"
	}

	Enable = {
		Export-Command "Err" "./app/Err.exe" -Symlink
	}
}
