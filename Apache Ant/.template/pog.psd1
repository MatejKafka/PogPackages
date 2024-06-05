@{
	Name = 'Ant'
	Architecture = '*'
	Version = '{{TEMPLATE:Version}}'
	Description = @"
Apache Ant is a Java library and command-line tool whose mission is to drive processes described
in build files as targets and extension points dependent upon each other. The main known usage
of Ant is the build of Java applications. Ant supplies a number of built-in tasks allowing to
compile, assemble, test and run Java applications. Ant can also be used effectively to build non
Java applications, for instance C or C++ applications. More generally, Ant can be used to pilot
any type of process which can be described in terms of targets and tasks.
"@

	Install = @{
		Url = '{{TEMPLATE:Url}}'
		Hash = '{{TEMPLATE:Hash}}'
	}

	Enable = {
		New-Directory "./data/lib"
		New-File "./data/antrc_pre.bat"
		New-File "./data/antrc_post.bat"

		# TODO: probably run the .jar directly, or with a small custom launcher,
		#       so that we don't need to override so many env vars
		Export-Command "ant" "./app/bin/ant.bat" `
			-Arguments @("-nouserlib", "-lib", "./data/lib") `
			-Environment @{
				ANT_HOME = "./app"

				HOME = "./data" # Ant looks in HOME for the rc .bat files created above
				USERPROFILE = "./data" # same as HOME
				HOMEDRIVE = "" # same as HOME
				HOMEPATH = "" # same as HOME
			}
	}
}
