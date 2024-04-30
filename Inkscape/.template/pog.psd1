@{
	Name = "Inkscape"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		New-Directory "./data"
		New-Directory "./cache"

		New-File "./data/fontconfig.conf.xml" -FixedContent $this._FontConfig

		Export-Shortcut "Inkscape" "./app/bin/inkscape.exe" -Environment @{
			# directory for Inkscape data
			INKSCAPE_PROFILE_DIR = "./data"
			# recently-used.xbel, created by GTK
			XDG_DATA_HOME = "./data"
			# .dbus-keyring directory is stored in HOME
			HOME = "./data"
			# fontconfig font cache configuration; otherwise, it would be written to LOCALAPPDATA;
			#  apparently, there isn't an environment variable to directly configure the cache path;
			#  instead, we have to create a config file and direct fontconfig to use it
			FONTCONFIG_FILE = "./data/fontconfig.conf.xml"
		}
	}

	_FontConfig = @"
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
	<cachedir>../cache/fontconfig</cachedir>
</fontconfig>
"@
}
