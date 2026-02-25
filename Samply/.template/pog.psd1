@{
    Name = 'Samply'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "samply" "./app/samply.exe" -Symlink
    }
}