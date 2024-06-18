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

		New-File "./config/config.toml" $this._GetDefaultConfig $this._PatchConfig

		Export-Command @("tealdeer", "tldr") "./app/tealdeer.exe" -VcRedist -Environment @{
			TEALDEER_CONFIG_DIR = "./config"
		}
	}

	_GetPath = {param($p) (Resolve-Path $p) -replace "\\", "\\" -replace '"', '\"'}

	# FIXME: not very robust
	_PatchConfig = {
		$Config = cat -Raw $_
		$NewConfig = $Config

		$ValI = $NewConfig.IndexOf("`ncache_dir")
		if ($ValI -ne -1) {
			$EndLine = $NewConfig.IndexOf("`n", $ValI + 1)
			if ($EndLine -eq -1) {$EndLine = $NewConfig.Length}
			$NewConfig = $NewConfig.Substring(0, $ValI + 1) +`
				"cache_dir = `"$(& $this._GetPath "./cache")`"" +`
				$NewConfig.Substring($EndLine, $NewConfig.Length - $EndLine)
		}

		$ValI = $NewConfig.IndexOf("`ncustom_pages_dir")
		if ($ValI -ne -1) {
			$EndLine = $NewConfig.IndexOf("`n", $ValI + 1)
			if ($EndLine -eq -1) {$EndLine = $NewConfig.Length}
			$NewConfig = $NewConfig.Substring(0, $ValI + 1) +`
				"custom_pages_dir = `"$(& $this._GetPath "./config/custom_pages")`"" +`
				$NewConfig.Substring($EndLine, $NewConfig.Length - $EndLine)
		}

		if ($NewConfig -ne $Config) {
			Set-Content $_ $NewConfig -NoNewline
		}
	}

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
