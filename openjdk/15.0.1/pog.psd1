@{
	Name = "openjdk"
	Architecture = "x64"
	Version = "15.0.1"
	
	Install = @{
		Url = "https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_windows-x64_bin.zip"
		Hash = "0A27C733FC7CEAAAE3856A9C03F5E2304AF30A32DE6B454B8762EC02447C5464"
	}
	
	Enable = {
		# export all .exe commands in ./app/bin
		ls ./app/bin/*.exe -File | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_)
		}
		
		# TODO: should we set JAVA_HOME?
	}
}
