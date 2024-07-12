$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://github.com/Blue-Maven-IT/Downloads/raw/main/TAIAECCustomizationv1.zip")



DO {write-host "downloading" }
UNTIL (Test-Path -Path "C:\docs\TAIAECCustomizationv1.zip") {write-host "finished downloading; ready to expand archive"}

Start-Sleep -Seconds 10

Expand-Archive -LiteralPath 'C:\docs\TAIAECCustomizationv1.zip'
