@{
	Name = "IntelliJ IDEA"
	Version = "2020.2.3"
	Architecture = @("x64", "x86")

	Install = {
		$Version = $this.Version
		$Url = "https://download.jetbrains.com/idea/ideaIU-$Version.win.zip"
		Install-FromUrl $Url -NoSubdirectory
	}
	
	Enable = {
		Assert-Directory "./config"
		Assert-Directory "./config/config"
		Assert-Directory "./config/plugins"
		Assert-Directory "./cache"
		Assert-Directory "./logs"

		Assert-File "./config/idea.properties" {$this._IdeaProperties}
		Assert-File "./config/idea64.exe.vmoptions" {Get-Content -Raw "./app/bin/idea64.exe.vmoptions"}
		Assert-File "./config/idea.exe.vmoptions" {Get-Content -Raw "./app/bin/idea.exe.vmoptions"}

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
idea.plugins.path=${package.path}/config/plugins
idea.log.path=${package.path}/logs
'@
}
