function bereinigeNamen($name)
{
	if ($name -eq $null)
	{
		return $null;
	}
	$name = $name.trim();
	$name = $name -replace "[^a-zA-Z0-9]", "";
	if   ($name -eq "")
	{
		return $null;
	}
	return $name;
}

function erzeugeTexlipseSettings($name)
{
  $settings = (gc _texlipse) -replace "NAME", $name;
  sc -path .texlipse -value $settings;
}

function erzeugeProjektstruktur($name)
{
  $ziel = "Ausarbeitungen\" + $name;
  if (test-path $ziel)
  {
    write-host ("Verzeichnis existiert bereits: " + $ziel) -foregroundcolor "red";
    exit;
  }
  copy -recurse -force Ausarbeitungen\Vorlage $ziel;
  move Ausarbeitungen\$name\Vorlage.tex $ziel\$name.tex;
}
