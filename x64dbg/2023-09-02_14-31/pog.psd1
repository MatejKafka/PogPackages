@{
	Name = 'x64dbg'
	Architecture = 'x64'
	Version = '2023-09-02_14-31'

	Install = @{
		Url = {"https://sourceforge.net/projects/x64dbg/files/snapshots/snapshot_$($this.Version).zip/download"}
		Hash = "6DACC6E4DFC3C8B55F93430921B65E3A45F6750C173E57C8A984D97597479300"
		Subdirectory = "release"
	}

	Enable = {
		New-Directory "./data"

		# see https://github.com/x64dbg/x64dbg/blob/dd91e4376a6d9e6cd3f2a6058e4e85d67ed1c54f/src/bridge/bridgemain.cpp#L99
		New-File "./app/x64/userdir" -FixedContent "../../data"
		New-File "./app/x86/userdir" -FixedContent "../../data"

		Export-Shortcut "x64dbg" "./app/x64/x64dbg.exe"
	}
}