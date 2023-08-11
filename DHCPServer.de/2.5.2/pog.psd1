@{
	Name = 'DHCPServer.de'
	Architecture = 'x86'
	Version = '2.5.2'

	Install = @{
		Url = "https://www.dhcpserver.de/cms/wp-content/plugins/download-attachments/includes/download.php?id=625"
		Hash = "24A9794AB6A47B8E7650AF1748D881E77DD739858013CCA64AF8E731904F376C"
	}

	Enable = {
		Set-SymlinkedPath "./app/wwwroot" "./data/wwwroot" Directory
		Set-SymlinkedPath "./app/dhcpsrv.ini" "./config/dhcpsrv.ini" File
		Set-SymlinkedPath "./app/dhcptrc.txt" "./logs/dhcptrc.txt" File

		Disable-DisplayScaling "./app/dhcpsrv.exe"
		Disable-DisplayScaling "./app/dhcpwiz.exe"

		Export-Shortcut "DHCPServer.de" "./app/dhcpsrv.exe"
		Export-Shortcut "DHCPServer.de Configuration" "./app/dhcpwiz.exe"
	}
}