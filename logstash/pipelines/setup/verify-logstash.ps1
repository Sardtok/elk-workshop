$logstashVersion = "logstash-2.2.2"
$logstashBinPath = "..\..\..\$logstashVersion\bin"

if (-not (test-path $logstashBinPath)) { 
	Write-Host "Sjekk at logstash er installert in f�lgene sti:"
	Write-Host $(resolve-path $logstashBinPath)
	exit 1
	}

Write-Host "For � verifisere at config filen er OK, kj�rer man f�lgende kommando"
Write-Host "..\..\..\$logstashVersion\bin\logstash agent -f verify.conf --configtest" -ForegroundColor Green
& "..\..\..\$logstashVersion\bin\logstash" agent -f verify.conf --configtest

Start-Sleep 2

Write-Host "N� skal vi kj�re logstash, med input fra kommandolinje. `nEtter at logstash har startet, skriv noe tekts og trykk ENTER. `nAvslut med Ctrl+C."

Start-Sleep 1

Write-Host "..\..\..\$logstashVersion\bin\logstash agent -f verify.conf" -ForegroundColor Green
& "..\..\..\$logstashVersion\bin\logstash" agent -f verify.conf
