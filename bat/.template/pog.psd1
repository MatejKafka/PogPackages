@{
	Name = "bat"
	Architecture = "x64"
	Version = '{{TEMPLATE:Version}}'

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./cache"
		New-File "./config/config" -DefaultContent {$this._DefaultConfigStr}

		Export-Command "bat" "./app/bat.exe" -VcRedist -Environment @{
			# BAT_CONFIG_PATH only sets the config file, not the whole config dir; since 19.0.0, it should be enough to set BAT_CONFIG_DIR,
			# but previous versions don't support that env var, so we set both
			BAT_CONFIG_PATH = "./config/config"
			BAT_CONFIG_DIR = "./config"
			BAT_CACHE_PATH = "./cache"
		}
	}

	_DefaultConfigStr = @'
# This is `bat`s configuration file. Each line either contains a comment or
# a command-line option that you want to pass to `bat` by default. You can
# run `bat --help` to get a list of all possible configuration options.

# Specify desired highlighting theme (e.g. "TwoDark"). Run `bat --list-themes`
# for a list of all available themes
#--theme="TwoDark"

# Enable this to use italic text on the terminal. This is not supported on all
# terminal emulators (like tmux, by default):
#--italic-text=always

# Uncomment the following line to disable automatic paging:
#--paging=never

# Uncomment the following line if you are using less version >= 551 and want to
# enable mouse scrolling support in `bat` when running inside tmux. This might
# disable text selection, unless you press shift.
#--pager="less --RAW-CONTROL-CHARS --quit-if-one-screen --mouse"

# Syntax mappings: map a certain filename pattern to a language.
#   Example 1: use the C++ syntax for Arduino .ino files
#   Example 2: Use ".gitignore"-style highlighting for ".ignore" files
#--map-syntax "*.ino:C++"
#--map-syntax ".ignore:Git Ignore"
'@
}
