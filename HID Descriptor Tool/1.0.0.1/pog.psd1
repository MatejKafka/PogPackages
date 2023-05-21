@{
	Name = 'HID Descriptor Tool'
	Architecture = 'x64'
	Version = '1.0.0.1'

	Install = @{
		Url = "https://www.usb.org/sites/default/files/documents/dt2_4.zip"
		Hash = "5A0D8716D97053D6B7A78625E4CC03006E5D6B4473E700277B1F862B27645D75"
		Subdirectory = "MSDEV/Projects/test"
	}

	Enable = {
		Disable-DisplayScaling "./app/Dt.exe"

		Export-Shortcut "HID Descriptor Tool" "./app/Dt.exe"
	}
}
