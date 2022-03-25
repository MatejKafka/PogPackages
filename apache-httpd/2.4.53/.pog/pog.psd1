@{
	Name = "apache-httpd"
	Architecture = "x64"

	Version = "2.4.53"
	_Hash = "C9D31F91293C4E0AE0FF42186196E667A606EAADD2719EC90E7ABE9B1A75635D"
	# version of Visual Studio this was built with
	# needed to construct the download URL
	_VsVersion = "VS16"
	
	Install = {
		# https://www.apachelounge.com/download/
		$Url = "https://www.apachelounge.com/download/$($this._VsVersion)/binaries/" +`
				"httpd-$($this.Version)-win64-$($this._VsVersion).zip"
		# use fake browser user agent, otherwise Apache Lounge silently redirects us to localhost
		Install-FromUrl $Url -ExpectedHash $this._Hash -Subdirectory Apache24 -UserAgent Browser
	}
	
	Enable = {
		Set-SymlinkedPath "./app/conf" "./config" Directory
		Set-SymlinkedPath "./app/htdocs" "./data" Directory
		Set-SymlinkedPath "./app/logs" "./logs" Directory
		
		& ./.pog/setupHttpdConf.ps1
		
		Export-Command 'httpd' "./app/bin/httpd.exe" -NoSymlink
	}
}
