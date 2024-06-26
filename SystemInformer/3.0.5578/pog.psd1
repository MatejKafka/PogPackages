@{
	Name = "SystemInformer"
	Version = "3.0.5578"
	Architecture = "x64"

	# NOTE: to unlock the kernel driver file, use `fltmc unload KSystemInformer`;
	#  then there's ksi.dll, I did not find any good way to unlock it, you'll probably need to restart
	Install = @{
		Url = "https://github.com/winsiderss/si-builds/releases/download/3.0.5578/systeminformer-3.0.5578-bin.zip"
		Hash = "B371788B41C413BD15AE0D69E4D7334338220FF10D521AEA07213C4C3EFA6DEC"
		Subdirectory = "64bit"
	}

	Enable = {
		param(
				[switch]
			$Elevate,
				[switch]
			$NoKernelDriver
		)

		$SettingsRelPath = "./config/SystemInformer.exe.settings.xml"

		New-Directory "./config"
		# ensure auto-updates are disabled
		New-File $SettingsRelPath {$this._DefaultConfig} $this._DisableAutoUpdate

		# `-settings` CLI argument was removed in 2022, dunno why
		New-Symlink "./app/SystemInformer.exe.settings.xml" $SettingsRelPath File
		New-Symlink "./app/usernotesdb.xml" "./config/usernotesdb.xml" File

		# args list here: https://wj32.org/processhacker/forums/viewtopic.php?t=75
		$Args = @()
		if ($Elevate) {$Args += "-elevate"}
		if ($NoKernelDriver) {$Args += "-nokph"}
		Export-Shortcut "SystemInformer" "./app/SystemInformer.exe" -Arguments $Args
	}

_DefaultConfig = @'
<settings>
  <setting name="DisabledPlugins">Updater.dll</setting>
</settings>
'@

	_DisableAutoUpdate = {
        $File = Resolve-Path $_

        $d = [XML](Get-Content -Raw $File)
        $settings = $d.settings
        $elem = $settings.setting | ? {$_.name -eq "DisabledPlugins"}

        if ($null -eq $elem) {
            $elem = $d.CreateElement("setting")
            $null = $elem.Attributes.Append($d.CreateAttribute("name"))
            $elem.name = "DisabledPlugins"
            $null = $settings.AppendChild($elem)
        }

        $disabledList = if ("" -eq $elem.InnerText) {
            @()
        } else {
            $elem.InnerText.Split("|")
        }

        if ("Updater.dll" -in $disabledList) {
            return $false
        }

        $disabledList += "Updater.dll"
        $elem.InnerText = $disabledList -join "|"

        $null = $d.Save($File)
        return $true
	}
}
