@{
	Name = "qBittorrent"
	Architecture = "x64"

	Version = "4.2.5"
	_Hash = "62731C7D44C217B79724CB23BEF4267570332ED67C1C1FEEF3F6C803A6F57EF3"

	Install = {
		$Version = $this.Version
		$Url = "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${Version}/qbittorrent_${Version}_x64_setup.exe"
		Install-FromUrl $Url -ExpectedHash $this._Hash -NsisInstaller -UserAgent Wget
	}

	Enable = {
		Set-SymlinkedPath "./app/profile/qBittorrent/cache"  "./cache"  Directory
		Set-SymlinkedPath "./app/profile/qBittorrent/config" "./config" Directory
		Set-SymlinkedPath "./app/profile/qBittorrent/data"   "./data"   Directory
		Set-SymlinkedPath "./data/logs" "./logs" Directory
		
		Export-Shortcut "qBittorrent" "./app/qbittorrent.exe"
		
		# TODO: disable auto-update
		
		# TODO: open firewall for torrenting (otherwise the install is not really portable,
		#  because it fails after reinstall, as it thinks it already asked for firewall permission)
	}
}

