@{
	Name = 'lessmsi'
	Architecture = 'x64'
	Version = '1.11.0'

	Install = @{
		Url = {"https://github.com/activescott/lessmsi/releases/download/v$($this.Version)/lessmsi-v$($this.Version).zip"}
		Hash = "C5EFA174BDAC1956D6EF0CEBC39A8F1077FFDE6105AF4601F8502CB53950E636"
	}

	Enable = {
		Assert-Directory "./data"

		Set-SymlinkedPath "./app/lessmsi-gui.exe.config" "./data/lessmsi-gui.exe.config" File

		Disable-DisplayScaling "./app/lessmsi-gui.exe"

		Export-Shortcut "Less MSI" "./app/lessmsi-gui.exe"
		Export-Command "lessmsi" "./app/lessmsi.exe"
	}
}