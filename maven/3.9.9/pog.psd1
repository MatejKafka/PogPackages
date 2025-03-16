@{
	Name = "maven"
	Version = "3.9.9"
	Architecture = "x64"

	Description = "Apache Maven"

	Install = @{
		Url = "https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.zip"
		Hash = "4EC3F26FB1A692473AEA0235C300BD20F0F9FE741947C82C1234CEFD76AC3A3C"
	}

	Enable = {
		New-Symlink "./app/conf" "./config" Directory
		New-Directory "./data"
		New-Directory "./data/repository"


		# set local repository path
		$SettingsPath = Resolve-Path "./config/settings.xml"
		$Settings = [XML](Get-Content $SettingsPath)

		# create the XML element
		if (-not ($Settings.settings | Get-Member -MemberType Property -Name localRepository)) {
			$el = $Settings.CreateElement("localRepository", $Settings.DocumentElement.NamespaceURI)
			[void]$Settings.settings.PrependChild($el)
		}

		# check if the correct path is set
		$RepoPath = Resolve-Path "./data/repository"
		if ($Settings.settings.localRepository -eq $RepoPath) {
			Write-Verbose "Local Maven repository is already setup."
		} else {
			$Settings.settings.localRepository = $RepoPath
			$Settings.Save($SettingsPath)
			Write-Verbose "Setup local Maven package repository at ./data/repository."
		}

		Export-Command "mvn" "./app/bin/mvn.cmd"
	}
}

