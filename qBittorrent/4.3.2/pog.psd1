@{
	Name = "qBittorrent"
	Architecture = "x64"
	Version = "4.3.2"

	Install = @{
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${Version}/qbittorrent_${Version}_x64_setup.exe"}
		Hash = "81FE1FAA5E0C32F212D42589E888F583C2F8936D694A33F1DD4F83BB84669EAA"
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
