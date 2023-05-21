@{
	Name = "qBittorrent"
	Architecture = "x64"
	Version = "4.4.3.1"

	Install = @{
		Url = {$V = $this.Version; "https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/" +`
			"qbittorrent-${V}/qbittorrent_${V}_x64_setup.exe"}
		Hash = "07F1777B4508C5629E26BB592050DFD4421169B76DE79001D2F0350F92010F23"
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
