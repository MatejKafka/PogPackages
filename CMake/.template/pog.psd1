@{
	Name = "CMake"
	Architecture = "x64"
	Version = "{{TEMPLATE:Version}}"
	
	Install = @{
		Url = "{{TEMPLATE:Url}}"
		Hash = "{{TEMPLATE:Hash}}"
	}
	
	Enable = {
		Export-Command "cmake" "./app/bin/cmake.exe" -Symlink
		Export-Command "cpack" "./app/bin/cpack.exe" -Symlink
		Export-Command "ctest" "./app/bin/ctest.exe" -Symlink
		Export-Command "cmcldeps" "./app/bin/cmcldeps.exe" -Symlink
		
		Export-Shortcut "CMake (cmake-gui)" "./app/bin/cmake-gui.exe"
	}
}
