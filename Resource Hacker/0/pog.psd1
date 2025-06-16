@{
	Name = "Resource Hacker"
	Architecture = "x86"
	Version = "0"

	Install = @{
		# No URL versioning, unfortunately
		Url = "http://angusj.com/resourcehacker/resource_hacker.zip"
	}

	Enable = {
		New-Directory "./config"
		New-Symlink "./app/ResourceHacker.ini" "./config/ResourceHacker.ini" File

		Export-Shortcut "Resource Hacker" "./app/ResourceHacker.exe"
	}
}