@{
    Name = 'Make@GnuWin'
    Architecture = 'x64'
    Version = '{{TEMPLATE:Version}}'

    Install = @(
        @{
            Url = {$V = $this.Version; "https://sourceforge.net/projects/gnuwin32/files/make/$V/make-$V-bin.zip/download"}
            Hash = '{{TEMPLATE:HashBin}}'
            Subdirectory = 'bin'
        }
        @{
            Url = {$V = $this.Version; "https://sourceforge.net/projects/gnuwin32/files/make/$V/make-$V-dep.zip/download"}
            Hash = '{{TEMPLATE:HashDep}}'
            Subdirectory = 'bin'
        }
    )

    Enable = {
        Export-Command "make" "./app/make.exe"
    }
}