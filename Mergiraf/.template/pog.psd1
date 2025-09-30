@{
    Name = 'Mergiraf'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "mergiraf" "./app/mergiraf.exe" -Symlink
    }
}