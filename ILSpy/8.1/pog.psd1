@{
	Name = 'ILSpy'
	Architecture = 'x64'
	Version = '8.1'

	Install = @{
		Url = 'https://github.com/icsharpcode/ILSpy/releases/download/v8.1/ILSpy_selfcontained_8.1.0.7455-x64.zip'
		Hash = 'A23BF02D54C3CA40E5426FDC56118F27ECAC4209FA7D2CEA453A6DE88A053108'
	}

	Enable = {
		New-File "./config/ILSpy.xml" {$this._DefaultConfig}
		# ILSpy uses a local config file if it exists
		New-Symlink "./app/ILSpy.xml" "./config/ILSpy.xml" File

		Export-Shortcut "ILSpy" "./app/ILSpy.exe"
	}

	_DefaultConfig = @"
<?xml version="1.0" encoding="utf-8"?>
<ILSpy version="8.1.0.7455">
  <UpdateSettings>
    <AutomaticUpdateCheckEnabled>false</AutomaticUpdateCheckEnabled>
  </UpdateSettings>
</ILSpy>
"@
}