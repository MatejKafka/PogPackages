@{
	Name = 'USBDeview'
	Architecture = 'x64'
	Version = '3.0.6'

	Install = @{
		Url = "https://www.nirsoft.net/utils/usbdeview-x64.zip"
		Hash = "F48EF907767754BE0831FB9E64399F3A9204174189FD5E247D91BFE2855F7E26"
	}

	Enable = {
		Set-SymlinkedPath "./app/USBDeview.cfg" "./config/USBDeview.cfg" File

		Export-Command "USBDeview" "./app/USBDeview.exe" -NoSymlink
		Export-Shortcut "USBDeview" "./app/USBDeview.exe"
	}
}
