. .\functions.ps1

@(
  "*.nls",
  "*.nlo",
  "*.lol",
  "*.aux",
  "*.log",
  "*.toc",
  "*.ind",
  "*.ilg",
  "*.bbl",
  "*.blg",
  "*.lot",
  "*.lof",
  "*.snm",
  "*.nav",
  "*.out",
  "*.vrb",
  "*.bcf",
  "*.synctex.gz"
) | % {
  gci -include $_ -force -recurse | del -force;
}

@("tmp\", "Ausarbeitungen\test\", "test.pdf") | % {
	if (test-path $_)
	{
		del -force -recurse $_;
	}
}

erzeugeTexlipseSettings "Vorlage";
