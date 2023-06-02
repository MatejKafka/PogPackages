@{
	Name = "openjdk"
	Architecture = "x64"
	Version = "19.0.2"
	
	Install = @{
		Url = "https://download.java.net/java/GA/jdk19.0.2/fdb695a9d9064ad6b064dc6df578380c/7/GPL/openjdk-19.0.2_windows-x64_bin.zip"
		Hash = "9F70EBA3F2631674A2D7D3AA01150D697F68BE16AD76662FF948D7FE1B4985D8"
	}
	
	Enable = {
		# export all .exe commands in ./app/bin
		ls ./app/bin/*.exe -File | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_)
		}
		
		# TODO: should we set JAVA_HOME?
	}
}
