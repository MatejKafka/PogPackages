@{
    Name = 'scrcpy'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        # scrcpy has no config
        Export-Command "scrcpy" "./app/scrcpy.exe"
    }
}