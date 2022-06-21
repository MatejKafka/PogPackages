@{
	Name = "apache-httpd"
	Architecture = "x64"
	Version = "2.4.53"
	# version of Visual Studio this was built with
	# needed to construct the download URL
	_VsVersion = "VS16"
	
	Install = @{
		# https://www.apachelounge.com/download/
		Url = {"https://www.apachelounge.com/download/$($this._VsVersion)/binaries/httpd-$($this.Version)-win64-$($this._VsVersion).zip"}
		# it seems like Apache Lounge is updating the hash sometimes?
		# quite sure this originally used to be: C9D31F91293C4E0AE0FF42186196E667A606EAADD2719EC90E7ABE9B1A75635D
		Hash = "5137D98A6E305046F9F2D97FEF4511F5046D9EB015B9A832DC481C485F8E2567"
		Subdirectory = "Apache24"
		UserAgent = "Browser"
	}
	
	Enable = {
		Set-SymlinkedPath "./app/conf" "./config" Directory
		Set-SymlinkedPath "./app/htdocs" "./data" Directory
		Set-SymlinkedPath "./app/logs" "./logs" Directory
		
		& ./.pog/setupHttpdConf.ps1
		
		Export-Command 'httpd' "./app/bin/httpd.exe" -NoSymlink
	}
}
