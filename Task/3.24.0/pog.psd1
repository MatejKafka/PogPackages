@{
	Name = 'Task'
	Architecture = 'x64'
	Version = '3.24.0'

	Install = @{
		Url = {"https://github.com/go-task/task/releases/download/v$($this.Version)/task_windows_amd64.zip"}
		Hash = "99F7AB584B48EA9C8D77A86D22ACA4B7ABDB3EA5DB2351376FB4E6D6D9740040"
	}

	Enable = {
		Export-Command "task" "./app/task.exe" -Symlink
	}
}
