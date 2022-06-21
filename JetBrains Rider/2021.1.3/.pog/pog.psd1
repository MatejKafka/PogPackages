@{
	Name = "JetBrains Rider"
	Architecture = "x64"
	Version = "2021.1.3"

	Install = @{
		Url = {"https://download.jetbrains.com/rider/JetBrains.Rider-$($this.Version).win.zip"}
		Hash = "706025bf09c655b574b28ed71827f68d9cf9a548ec1f6fec7b65f8abd51c2fcf"
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
		Assert-File "./config/config/options/updates.xml" {$this._UpdatesXml} "$ManifestRoot/DisableAutoUpdate.ps1"

		Export-Shortcut "JetBrains Rider" "$ManifestRoot/rider_shortcut.cmd" -IconPath "./app/bin/rider.ico"
		Export-Command "rider" "$ManifestRoot/rider_command.cmd" -NoSymlink
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

