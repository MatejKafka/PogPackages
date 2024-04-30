@{
	Name = "qemu"
	Architecture = "x64"
	Version = "2021-08-10"

	Install = @{
		Url = {$parts = $this.Version -split "-"; "https://qemu.weilnetz.de/w64/$($parts[0])/qemu-w64-setup-$($parts -join '').exe"}
		Hash = "E93705BB6F21051071154730234655C01AAA710EAA4C0DA131FDF0DF3F0E7805"
		NsisInstaller = $true
	}

	Enable = {
		# https://bugs.launchpad.net/qemu/+bug/1766841
		# seems this file has to exist, even if empty, otherwise qemu-system-... binaries print a warning
		New-File "./app/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"

		# export all emulator binaries compiled for console (no -w sufix) as commands
		ls ./app -File | ? {$_.Name -match "qemu-system-.+[^w]\.exe"} | % {
			Export-Command $_.BaseName "./app/$($_.Name)"
		}

		# TODO: export the -w.exe GUI versions of binaries as shortcuts
		#  update: is that really a good idea?
	}
}
