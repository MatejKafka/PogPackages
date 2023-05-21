@{
	Name = "openjdk"
	Architecture = "x64"
	Version = "17.0.2"
	
	Install = @{
		Url = "https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_windows-x64_bin.zip"
		Hash = "B2208206BDA47F2E0C971A39E057A5EC32C40B503D71E486790CB728D926B615"
	}
	
	Enable = {
		# export all .exe commands in ./app/bin
		ls ./app/bin/*.exe -File | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_) -NoSymlink
		}
		
		# TODO: should we set JAVA_HOME?
	}
}
