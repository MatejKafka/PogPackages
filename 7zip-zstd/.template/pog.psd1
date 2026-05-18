@{
    Name = '7zip-zstd'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Website = "https://mcmilk.de/projects/7-Zip-zstd/"
    Description = "7-Zip with support for Zstandard, Brotli, Lz4, Lz5 and Lizard Compression"

    Install = @{
        Url = '{{TEMPLATE:Url}}'
        Hash = '{{TEMPLATE:Hash}}'
    }

    Enable = {
        # do NOT export the GUI apps, as they write to the Registry
        Export-Command "7z" "./app/7z.exe" -VcRedist
    }
}