@{
	Name = "qBittorrent"
	Architecture = "x64"
	Version = "4.4.1"

	Install = @{
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${Version}/qbittorrent_${Version}_x64_setup.exe"}
		Hash = "D75395193AFCD161281A24B01EF523AA012B8CB2C116579081D7C6664425ACFE"
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
