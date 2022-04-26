@{
	Name = "qemu"
	Architecture = "x64"
	Version = "6.0.93"

	Install = @{
		Url = "https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210810.exe"
		Hash = "E93705BB6F21051071154730234655C01AAA710EAA4C0DA131FDF0DF3F0E7805"
		NsisInstaller = $true
	}

	Enable = {
		# https://bugs.launchpad.net/qemu/+bug/1766841
		# seems this file has to exist, even if empty, otherwise qemu-system-... binaries print a warning
		Assert-File "./app/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"

		# export all emulator binaries compiled for console (no -w sufix) as commands
		ls ./app -File | ? {$_.Name -match "qemu-system-.+[^w]\.exe"} | % {
			Export-Command $_.BaseName "./app/$($_.Name)" -NoSymlink
		}

		# TODO: export the -w.exe GUI versions of binaries as shortcuts
		#  update: is that really a good idea?
	}
}
