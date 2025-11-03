@{
    Name = 'SpawnCamper'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        if ([Pog.PackageVersion]$this.Version -ge "0.3.1") {
            Export-Command "SpawnCamper" "./app/SpawnCamper.ps1" -Symlink
            Export-Command "SpawnCamper.Tracer" "./app/SpawnCamper.Tracer.exe"
            Export-Command "SpawnCamper.Server" "./app/SpawnCamper.Server.exe"
            Export-Shortcut "SpawnCamper Server" "./app/SpawnCamper.Server.exe"
        } else {
            Export-Command "SpawnCamper" "./app/launcher.ps1" -Symlink
            Export-Command "SpawnCamper.Client" "./app/SpawnCamper.exe"
            Export-Command "SpawnCamper.Server" "./app/server/SpawnCamper.Server.exe"
            Export-Shortcut "SpawnCamper Server" "./app/server/SpawnCamper.Server.exe"
        }
    }
}