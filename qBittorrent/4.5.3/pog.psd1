@{
	Name = "qBittorrent"
	Architecture = "x64"
	Version = "4.5.3"

	Install = @{
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${V}/qbittorrent_${V}_x64_setup.exe"}
		Hash = "99B0FCE9FCF8F384B435F4D685536FF2E4150224EF0391C581588BA55E75A138"
		UserAgent = "Wget"
		NsisInstaller = $true
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
