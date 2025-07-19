@{
    Name = 'dive'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        New-File "./config/dive.yaml"

        Export-Command "dive" "./app/dive.exe" -Arguments "--config", "./config/dive.yaml"
    }
}