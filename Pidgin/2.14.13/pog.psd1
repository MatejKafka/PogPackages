@{
	Name = 'Pidgin'
	Architecture = 'x86'
	Version = '2.14.13'

	Install = @(
		@{
			Url = {"https://sourceforge.net/projects/pidgin/files/Pidgin/$($this.Version)/pidgin-$($this.Version)-win32-bin.zip/download"}
			Hash = "F3667F3076BEBDEE8AE687DD694CD2A3A6DFFEF97C6889B2D14BEE61C1C9FA91"
			Target = "pidgin"
			SetupScript = {
				rm -Recurse "plugins/perl", "plugins/perl.dll", "locale"
				#Rename-Item "pidgin.exe" "pidgin-portable.exe"
			}
		}
		@{
			Url = "https://sourceforge.net/projects/pidgin/files/GTK%2B%20for%20Windows/2.16.6.3/gtk-runtime-2.16.6.3.zip/download"
			Hash = "D173B43DEBD38FDEA1A4B74CFC0A43F8C062394188BE35202187F2C299B7BF5A"
			Target = "gtk"
			SetupScript = {rm -Recurse "share/doc", "share/locale"}
		}
	)

	Enable = {
		Set-SymlinkedPath "./app/.purple" "./data" Directory
		Disable-DisplayScaling "./app/pidgin/pidgin.exe"

		Export-Shortcut "Pidgin" "./app/pidgin/pidgin.exe" -Environment @{
			PURPLEHOME = "./data"
			PIDGIN_MULTI_INST = ""
			PATH = "./app/gtk/bin", "%PATH%"
		}
	}
}