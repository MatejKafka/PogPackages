@{
	Name = "JetBrains Rider"
	Architecture = "x64"
	Version = "2020.2"

	Install = @{
		Url = {"https://download.jetbrains.com/rider/JetBrains.Rider-$($this.Version).win.zip"}
		Hash = "19d76f6e36c8a1d04d6beda8270592104997336c328b2b43b998da192d99e460"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/plugins"
		Assert-Directory "./logs"


		Assert-File "./config/idea.properties" {$this._IdeaProperties}
		Assert-File "./config/rider64.exe.vmoptions" {Get-Content -Raw "./app/bin/rider64.exe.vmoptions"}

		# ensure auto-updates are disabled
		Assert-File "./config/config/options/updates.xml" {$this._UpdatesXml} "./.pog/DisableAutoUpdate.ps1"

		Export-Shortcut "JetBrains Rider" "./.pog/rider_shortcut.cmd" -IconPath "./app/bin/rider.ico"
		Export-Command "rider" "./.pog/rider_command.cmd" -NoSymlink
	}

# content of generated idea.properties
# it would be simpler&cleaner to have it as separate file in manifest directory,
#  but that would draw users to manually overwrite it and then
#  wonder why their changes were lost on update
_IdeaProperties = @'
# custom idea.properties file that allows us to use portable paths
package.path=${idea.home.path}/..

idea.system.path=${package.path}/cache
idea.config.path=${package.path}/config/config
idea.plugins.path=${package.path}/data/plugins
idea.log.path=${package.path}/logs
'@

_UpdatesXml = @'
<application>
  <component name="UpdatesConfigurable">
    <option name="CHECK_NEEDED" value="false" />
  </component>
</application>
'@
}

