. .\functions.ps1

.\cleanLaTeXFiles.ps1

$name = bereinigeNamen($args[0])
if ($name -eq $null)
{
	write-host "Benutzung: .\erzeugeAusarbeitung.ps1 NAME";
	write-host "  NAME: Name der zu erzeugenden Ausarbeitung. Nur Klein-, Großbuchstaben und Zahlen sind erlaubt.";
	exit;
}

write-host ("Erzeuge neue Vorlage für Ausarbeitung mit Namen <" + $name + ">");
erzeugeTexlipseSettings $name;
erzeugeProjektstruktur $name;