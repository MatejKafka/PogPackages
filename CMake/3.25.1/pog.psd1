@{
	Name = "CMake"
	Architecture = "x64"
	Version = "3.25.1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/Kitware/CMake/releases/download/v${V}/cmake-${V}-windows-x86_64.zip"}
		Hash = "D93958D87CC9B91983489F0B37A268B03A3C891894D11F5437FA2A5CE94AAB24"
	}
	
	Enable = {
		Export-Command "cmake" "./app/bin/cmake.exe"
		Export-Command "cpack" "./app/bin/cpack.exe"
		Export-Command "ctest" "./app/bin/ctest.exe"
		Export-Command "cmcldeps" "./app/bin/cmcldeps.exe"
		
		Export-Shortcut "CMake (cmake-gui)" "./app/bin/cmake-gui.exe"
	}
}
