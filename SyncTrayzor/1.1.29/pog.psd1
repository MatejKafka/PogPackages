@{
	Name = 'SyncTrayzor'
	Architecture = 'x64'
	Version = '1.1.29'

	Install = @{
		Url = {"https://github.com/canton7/SyncTrayzor/releases/download/v$($this.Version)/SyncTrayzorPortable-x64.zip"}
		Hash = "32CD19D644982196B04039790FFB335D19CE138F8A1B700AA9884D8A1745E29E"
	}

	Enable = {
		New-Directory "./data"
		New-Directory "./logs"

		& $this._UpdateXmlFile "./app/SyncTrayzor.exe.config" {
			param($Config)

			# disable autoupdate
			$Config.configuration.settings.DefaultUserConfiguration.NotifyOfNewVersions = "false"

			# configure data/logs paths; by default, all paths are inside the ./app directory, by adding ..\, we move them one level up;
			#  conveniently, all directory names match the Pog convention
			foreach ($PathNode in $Config.configuration.settings.PathConfiguration.ChildNodes | ? NodeType -eq Element) {
				$Value = $PathNode.InnerText
				if ($Value -notlike "..\*") {
					if ($Value -notlike "data*" -and $Value -notlike "logs*") {
						throw "Unexpected config path at '$($PathNode.Name)': $Value"
					}
					$PathNode.InnerText = "..\" + $PathNode.InnerText
				}
			}
		}

		Export-Shortcut "SyncTrayzor" "./app/SyncTrayzor.exe"
	}

	_UpdateXmlFile = {
		param($FilePath, $UpdateSb)

		$Resolved = Resolve-Path $FilePath

		# update the config file
		$Xml = [xml]::new()
		$Xml.PreserveWhitespace = $true
		$Xml.Load($Resolved)

		$Changed = $false
		$Handler = {
			param($Sender, $Event)
			if ($Event.OldValue -ne $Event.NewValue) {
				([ref]$Changed).Value = $true
			}
		}
		$Xml.add_NodeChanged($Handler)
		$Xml.add_NodeInserted($Handler)
		$Xml.add_NodeRemoved($Handler)

		# update the XML DOM
		& $UpdateSb $Xml

		if ($Changed) {
			$Xml.Save($Resolved)
			Write-Information "Updated '$FilePath'."
		} else {
			Write-Verbose "'$FilePath' is already correctly configured."
		}
	}
}
