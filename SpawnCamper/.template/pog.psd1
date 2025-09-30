@{
    Name = 'SpawnCamper'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "SpawnCamper" "./app/launcher.ps1" -Symlink
        Export-Command "SpawnCamper.Client" "./app/SpawnCamper.exe"
        Export-Command "SpawnCamper.Server" "./app/server/SpawnCamper.Server.exe"
        Export-Shortcut "SpawnCamper Server" "./app/server/SpawnCamper.Server.exe"
    }
}