@{
    Name = 'BluetoothDevicePairing'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        Export-Command "BluetoothDevicePairing" "./app/BluetoothDevicePairing.exe" -Symlink
    }
}