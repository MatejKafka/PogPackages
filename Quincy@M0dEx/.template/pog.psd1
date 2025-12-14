@{
    Name = 'Quincy@M0dEx'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        New-Directory "./config"

        Export-Shortcut "Quincy" "./app/quincy-client-gui.exe" -Arguments "--config-dir", "./config"
        Export-Command "quincy-client-gui" "./app/quincy-client-gui.exe" -Arguments "--config-dir", "./config"

        Export-Command "quincy-client-daemon" "./app/quincy-client-daemon.exe"
        Export-Command "quincy-client" "./app/quincy-client.exe"
        Export-Command "quincy-server" "./app/quincy-server.exe"
        Export-Command "quincy-users" "./app/quincy-users.exe"
    }
}