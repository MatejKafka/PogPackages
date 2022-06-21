@{
	Name = "CMake"
	Architecture = "x64"
	Version = "3.19.0-rc1"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/Kitware/CMake/releases/download/v${V}/cmake-${V}-win64-x64.zip"}
		Hash = "1FCAF9300055AFA6AC40BC5FC2864F1170D2281E93FDBA3EDF59F96A955C45FD"
	}
	
	Enable = {
		Export-Command "cmake" "./app/bin/cmake.exe"
		Export-Command "cpack" "./app/bin/cpack.exe"
		Export-Command "ctest" "./app/bin/ctest.exe"
		Export-Command "cmcldeps" "./app/bin/cmcldeps.exe"
		
		Export-Shortcut "CMake (cmake-gui)" "./app/bin/cmake-gui.exe"
	}
}
