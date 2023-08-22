@{
	Name = "speedtest"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {"https://install.speedtest.net/app/cli/ookla-speedtest-$($this.Version)-win64.zip"}
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Assert-Directory "./config"
		Export-Command "speedtest" "./app/speedtest.exe" -Environment @{
			APPDATA = "./config"
			# weirdly, this has to be overriden; any value works, and speedtest.exe uses provided APPDATA;
			# if we keep the real USERPROFILE, it ignores the overriden APPDATA and writes to the real AppData
			# one might think that setting USERPROFILE and keeping original APPDATA should work; nope, it doesn't
			USERPROFILE = "-"
		}
	}
}
