@{
	Name = 'tealdeer'
	Architecture = 'x64'
	Version = '1.6.1'

	Install = @{
		Url = {"https://github.com/dbrgn/tealdeer/releases/download/v$($this.Version)/tealdeer-windows-x86_64-msvc.exe"}
		Hash = "ABF2708B4932BC67BBEE7C194D482146BAD2FC880EE9D54DD0892524601BAD31"
		NoArchive = $true
		Target = "tealdeer.exe"
	}

	Enable = {
		New-Directory "./config"
		New-Directory "./config/custom_pages"
		New-Directory "./cache"

		# TODO: fix existing config
		New-File "./config/config.toml" $this._GetDefaultConfig

		Export-Command @("tealdeer", "tldr") "./app/tealdeer.exe" -VcRedist -Environment @{
			TEALDEER_CONFIG_DIR = "./config"
		}
	}

	_GetPath = {param($p) (Resolve-Path $p) -replace "\\", "\\" -replace '"', '\"'}
	_GetDefaultConfig = {@"
[style.description]
underline = false
bold = false
italic = false

[style.command_name]
foreground = "cyan"
underline = false
bold = false
italic = false

[style.example_text]
foreground = "green"
underline = false
bold = false
italic = false

[style.example_code]
foreground = "cyan"
underline = false
bold = false
italic = false

[style.example_variable]
foreground = "cyan"
underline = true
bold = false
italic = false

[display]
compact = false
use_pager = false

[updates]
auto_update = false
auto_update_interval_hours = 720

[directories]
cache_dir = "$(& $this._GetPath "./cache")"
custom_pages_dir = "$(& $this._GetPath "./config/custom_pages")"
"@}
}
