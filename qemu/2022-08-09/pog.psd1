@{
	Name = "qemu"
	Architecture = "x64"
	Version = "2022-08-09"

	Install = @{
		Url = {$parts = $this.Version -split "-"; "https://qemu.weilnetz.de/w64/$($parts[0])/qemu-w64-setup-$($parts -join '').exe"}
		Hash = "3E8A8C7E87A40EC207046A4ADE1F03C577CE698B068647EF0D5175ED76BA483C"
		NsisInstaller = $true
	}

	Enable = {
		# https://bugs.launchpad.net/qemu/+bug/1766841
		# seems this file has to exist, even if empty, otherwise qemu-system-... binaries print a warning
		Assert-File "./app/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"

		# export all emulator binaries compiled for console (no -w sufix) as commands
		ls ./app -File | ? {$_.Name -match "qemu-system-.+[^w]\.exe"} | % {
			Export-Command $_.BaseName "./app/$($_.Name)"
		}

		# TODO: export the -w.exe GUI versions of binaries as shortcuts
		#  update: is that really a good idea?
	}
}
