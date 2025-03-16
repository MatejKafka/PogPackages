@{
	Name = 'AsmSpy'
	Architecture = 'x64'
	Version = '1.3.136'

	Install = @{
		Url = "https://ci.appveyor.com/api/buildjobs/72hiesataj7qq4ln/artifacts/asmspy.1.3.155.nupkg"
		Hash = "8FA90C2DCF73C6AEA83418A0EB837496EBE85551243592DFEFA6FE98A5B111FF"
		Subdirectory = "tools"
	}

	Enable = {
		Export-Command "AsmSpy" "./app/AsmSpy.exe" -Symlink
	}
}