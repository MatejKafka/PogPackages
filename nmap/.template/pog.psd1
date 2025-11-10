@{
	Name = "nmap"
	Architecture = "x86"
	Version = "{{TEMPLATE:Version}}"
	
	# TODO: requires npcap, figure out how to enforce it
	Install = @{
		Url = {"https://nmap.org/dist/nmap-$($this.Version)-setup.exe"}
		# from https://nmap.org/dist/sigs/
		Hash = "{{TEMPLATE:Hash}}"
		NsisInstaller = $true
	}
	
	Enable = {
		Export-Command "nmap" "./app/nmap.exe" -VcRedist
		Export-Command "ncat" "./app/ncat.exe" -VcRedist
		Export-Command "nc" "./app/ncat.exe" -VcRedist
	}
}
