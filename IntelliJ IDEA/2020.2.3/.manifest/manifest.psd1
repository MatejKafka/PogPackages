@{
	Name = "IntelliJ IDEA"
	Architecture = @("x64", "x86")

	Version = "2020.2.3"
	# found at https://download.jetbrains.com/idea/ideaIU-$Version.win.zip.sha256
	_Hash = "49AF7A3C9EFBC622D62684A5C0BEEDD476D1C535B10ED466903E85A15D522012"

	Install = {
		$Version = $this.Version
		$Url = "https://download.jetbrains.com/idea/ideaIU-$Version.win.zip"
		Install-FromUrl $Url -NoSubdirectory -ExpectedHash $this._Hash
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
		Assert-File "./config/idea64.exe.vmoptions" {Get-Content -Raw "./app/bin/idea64.exe.vmoptions"}
		Assert-File "./config/idea.exe.vmoptions" {Get-Content -Raw "./app/bin/idea.exe.vmoptions"}
		# ensure auto-updates are disabled
		Assert-File "./config/config/options/updates.xml" {$this._UpdatesXml} "./.manifest/DisableAutoUpdate.ps1"

		Export-Shortcut "IntelliJ IDEA" "./.manifest/idea_shortcut.cmd" -IconPath "./app/bin/idea.ico"
		Export-Command "idea" "./.manifest/idea_command.cmd" -NoSymlink
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
