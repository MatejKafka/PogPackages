@{
	Name = 'gnuplot'
	Architecture = 'x64'
	Version = '5.5end'

	Install = @{
		Url = "http://tmacchant33.starfree.jp/gnuplot_files/gp55end-20230107-win64-mingw.zip"
		Hash = "B6D684AA13D1B92BF39F80D46D916779BE6B91C7B7D22AF0DEC7F263FCE2680B"
	}

	Enable = {
		New-File "./config/gnuplot.ini"
		New-File "./config/wgnuplot.ini"

		Export-Command "gnuplot" "./app/bin/gnuplot.exe" -Environment @{GNUPLOT = "./config"}
	}
}