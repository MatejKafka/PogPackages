@{
	Name = "7zip"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = {"https://www.7-zip.org/a/7z$($this.Version.Replace('.', ''))-x64.exe"}
		Hash = "{{TEMPLATE:Hash}}"
	}

	Enable = {
		# do NOT export the GUI apps, as they write to the Registry
		Export-Command "7z" "./app/7z.exe" -VcRedist
	}
}
