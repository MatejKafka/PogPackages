@{
	Name = "openjdk"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		# export all .exe commands in ./app/bin
		ls ./app/bin/*.exe -File | % {
			Export-Command ([IO.Path]::GetFileNameWithoutExtension($_)) (Resolve-Path -Relative $_) -VcRedist
		}
		
		# TODO: should we set JAVA_HOME?
	}
}
