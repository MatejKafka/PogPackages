@{
	Name = "nmap"
	Architecture = "x86"
	Version = "7.90"
	
	# TODO: requires npcap, figure out how to enforce it
	Install = @{
		Url = {"https://nmap.org/dist/nmap-$($this.Version)-win32.zip"}
		# from https://nmap.org/dist/sigs/
		Hash = "0FDE4A846B120BDC2A7A91897DECEA4C99DAC5BEF90426A10CEC177948BC36DD"
	}
	
	Enable = {
		Export-Command "nmap" "./app/nmap.exe" -NoSymlink
		Export-Command "ncat" "./app/ncat.exe" -NoSymlink
		Export-Command "nc" "./app/ncat.exe" -NoSymlink
	}
}
