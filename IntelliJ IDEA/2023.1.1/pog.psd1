@{
	Name = "IntelliJ IDEA"
	Architecture = "x64"
	Version = "2023.1.1"

	Install = @{
		Url = {"https://download.jetbrains.com/idea/ideaIU-$($this.Version).win.zip"}
		Hash = "2bd115c7425d128e24a6cdfc9b6f82762d6e1b7d9868d0974faeaa18b54c3de3"
	}

	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/config"
		Assert-Directory "./cache"
		Assert-Directory "./data"
		Assert-Directory "./data/plugins"
		Assert-Directory "./logs"

		# TODO: check content for existing file
		Assert-File "./config/idea.properties" {$this._IdeaProperties}
		Assert-File "./config/idea64.exe.vmoptions" "./app/bin/idea64.exe.vmoptions"

		# ensure auto-updates are disabled
		Assert-File "./config/config/options/updates.xml" {$this._UpdatesXml} {& "./.pog/DisableAutoUpdate.ps1" $_}

		Export-Shortcut "IntelliJ IDEA" "./.pog/idea_shortcut.cmd" -IconPath "./app/bin/idea.ico"
		Export-Command "idea" "./.pog/idea_command.cmd"
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


