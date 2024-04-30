@{
	Name = "Resource Hacker"
	Architecture = "x86"
	Version = "5.1.8"

	Install = @{
		# No URL versioning, unfortunately
		Url = "http://angusj.com/resourcehacker/resource_hacker.zip"
		Hash = "D158BEBC2993CF6BEBF2C23A93572A68544C2BA5AE056538F70A58075C9392D6"
	}

	Enable = {
		New-Directory "./config"
		New-Symlink "./app/ResourceHacker.ini" "./config/ResourceHacker.ini" File

		Export-Shortcut "Resource Hacker" "./app/ResourceHacker.exe"
	}
}