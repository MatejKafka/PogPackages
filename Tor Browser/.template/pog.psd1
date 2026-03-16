@{
	Name = "Tor Browser"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"

	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
		NsisInstaller = $true

		SetupScript = {
			# disable auto-update
            Set-Content "./distribution/policies.json" '{"policies": {"DisableAppUpdate": true}}'
            Write-Information "Created policy file './distribution/policies.json'."
		}
	}

	Enable = {
        New-Symlink "./app/TorBrowser/Data" "./data" Directory

		Export-Shortcut "Tor Browser" "./app/firefox.exe"
	}
}
