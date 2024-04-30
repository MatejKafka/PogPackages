@{
	Name = 'PeaZip'
	Architecture = 'x64'
	Version = '9.4.0'

	Install = @{
		Url = {$V = $this.Version; "https://github.com/peazip/PeaZip/releases/download/${V}/peazip_portable-${V}.WIN64.zip"}
		Hash = "2956D3701172806B380ADDB45D40C37E169E29D575E0EBF2773BB0434D9D40AA"
	}

	Enable = {
		New-Symlink "./app/res/conf" "./config" Directory

		Export-Command "pea" "./app/pea.exe"
		Export-Command "peazip" "./app/peazip.exe"
		Export-Shortcut "pea" "./app/pea.exe"
		Export-Shortcut "peazip" "./app/peazip.exe"
	}
}