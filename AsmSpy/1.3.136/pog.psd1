@{
	Name = 'AsmSpy'
	Architecture = 'x64'
	Version = '1.3.136'

	Install = @{
		Url = "https://ci.appveyor.com/api/buildjobs/yfgfk2p6bfq425c4/artifacts/asmspy.1.3.136.nupkg"
		Hash = "82FBA310C14FBE8E9FF607E692F6E6E9F23373E308AF723FC09EB5C9BFB1129B"
		Subdirectory = "tools"
	}

	Enable = {
		Export-Command "AsmSpy" "./app/AsmSpy.exe" -Symlink
	}
}