@{
	Name = "Resource Hacker"
	# Alternative: Resource Cracker https://www.pelock.com/products/resource-cracker
	Architecture = "x86"
	Version = "0"

	Install = @{
		# No URL versioning, unfortunately
		Url = "http://angusj.com/resourcehacker/resource_hacker.zip"
		# Alternative: Resource Cracker https://www.pelock.com/download/resource-cracker.zip
	}

	Enable = {
		New-Directory "./config"
		New-Symlink "./app/ResourceHacker.ini" "./config/ResourceHacker.ini" File

		Export-Shortcut "Resource Hacker" "./app/ResourceHacker.exe"
		# Alternative: Resource Cracker https://www.pelock.com/download/resource-cracker.exe
	}
}