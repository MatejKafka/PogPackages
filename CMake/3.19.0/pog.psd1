@{
	Name = "CMake"
	Architecture = "x64"
	Version = "3.19.0"
	
	Install = @{
		Url = {$V = $this.Version; "https://github.com/Kitware/CMake/releases/download/v${V}/cmake-${V}-win64-x64.zip"}
		Hash = "67BBDA67C98C5F0789199FE1DB650F12274A6AD40FD8CAE88D208029AC618905"
	}
	
	Enable = {
		Export-Command "cmake" "./app/bin/cmake.exe"
		Export-Command "cpack" "./app/bin/cpack.exe"
		Export-Command "ctest" "./app/bin/ctest.exe"
		Export-Command "cmcldeps" "./app/bin/cmcldeps.exe"
		
		Export-Shortcut "CMake (cmake-gui)" "./app/bin/cmake-gui.exe"
	}
}
