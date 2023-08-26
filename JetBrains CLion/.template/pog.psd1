@{
	Name = "JetBrains CLion"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = {"https://download.jetbrains.com/cpp/CLion-$($this.Version).win.zip"}
		Hash = "{{TEMPLATE:Hash}}"
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
		Assert-File "./config/clion64.exe.vmoptions" "./app/bin/clion64.exe.vmoptions"

		# ensure auto-updates are disabled
		Assert-File "./config/config/options/updates.xml" {$this._UpdatesXml} $this._DisableAutoUpdate

		$Env = @{
			CLION_PROPERTIES = "./config/idea.properties"
			CLION_VM_OPTIONS = "./config/clion64.exe.vmoptions"
			CLION64_VM_OPTIONS = "./config/clion64.exe.vmoptions"
		}

		Export-Shortcut "CLion" "./app/bin/clion64.exe" -Environment $Env
		Export-Command "clion" "./app/bin/clion64.exe" -Environment $Env
	}

	_DisableAutoUpdate = {
		param([Parameter(Mandatory)]$File)

		$d = [XML](Get-Content -Raw $File)
		$c = $d.application.component
		$options = $c.option
		$prop = $options | ? {$_.name -eq "CHECK_NEEDED"}
		if ($null -eq $prop) {
			$prop = $d.CreateElement("option")
			$null = $prop.Attributes.Append($d.CreateAttribute("name"))
			$null = $prop.Attributes.Append($d.CreateAttribute("value"))
			$prop.name = "CHECK_NEEDED"
			$null = $c.AppendChild($prop)
		}
		if ($prop.value -eq "false") {return}
		$prop.value = "false"
		$null = $d.Save($File)
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
