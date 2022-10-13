@{
	Name = "ProcessHacker"
	Version = "3.0.4600"
	Architecture = "x64"
	
	# Note: to unlock the kernel driver file, use `sc stop kprocesshacker3`
	Install = @{
		Url = {$V = $this.Version; "https://github.com/ProcessHackerRepoTool/nightly-builds-mirror/releases/download/v$V/processhacker-$V-bin.zip"}
		Hash = "ECAC0B77357DC80A87AD2BC39E63CF7F390A158CCD9555749B4C1B61296CA20B"
		Subdirectory = "64bit"
	}

	Enable = {
		param(
				[switch]
			$NoKernelDriver
		)
	
		$SettingsRelPath = "./config/ProcessHacker.exe.settings.xml"
	
		Assert-Directory "./config"
		# ensure auto-updates are disabled
		Assert-File $SettingsRelPath {$this._DefaultConfig} "./.pog/DisableAutoUpdate.ps1"
		Assert-File $SettingsRelPath

		# args list here: https://wj32.org/processhacker/forums/viewtopic.php?t=75
		$Args = @("-elevate", "-settings", (Resolve-Path $SettingsRelPath))
		if ($NoKernelDriver) {
			$Args += "-nokph"
		}
		Export-Shortcut "ProcessHacker" "./app/ProcessHacker.exe" -Arguments $Args
	}

_DefaultConfig = @'
<settings>
  <setting name="DisabledPlugins">Updater.dll</setting>
</settings>
'@
}
