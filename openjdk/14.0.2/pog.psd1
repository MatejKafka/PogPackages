@{
	Name = "openjdk"
	Architecture = "x64"
	Version = "14.0.2"
	
	Install = @{
		Url = "https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_windows-x64_bin.zip"
		Hash = "20600C0BDA9D1DB9D20DBE1AB656A5F9175FFB990EF3DF6AF5D994673E4D8FF9"
	}
	
	Enable = {
		# export all .exe commands in ./app/bin
		ls ./app/bin/*.exe -File | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_)
		}
		
		# TODO: should we set JAVA_HOME?
	}
}
