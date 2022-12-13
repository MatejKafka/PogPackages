@{
	Name = "CMake"
	Architecture = "x64"
	Version = "3.23.4"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/Kitware/CMake/releases/download/v${V}/cmake-${V}-windows-x86_64.zip"}
		Hash = "DF15113AAAB9E5F8CAC254E02CF23F70D02407C9BF2983C82A9FE0D35BD20682"
	}
	
	Enable = {
		Export-Command "cmake" "./app/bin/cmake.exe"
		Export-Command "cpack" "./app/bin/cpack.exe"
		Export-Command "ctest" "./app/bin/ctest.exe"
		Export-Command "cmcldeps" "./app/bin/cmcldeps.exe"
		
		Export-Shortcut "CMake (cmake-gui)" "./app/bin/cmake-gui.exe"
	}
}
