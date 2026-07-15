# Run in Windows PowerShell as Administrator.
param(
    [string]$FileName = "suspicious-demo.txt"
)

$Source = Join-Path "C:\SOC-Lab\Monitored" $FileName
$Destination = Join-Path "C:\SOC-Lab\Quarantine" $FileName

if (-not (Test-Path $Source)) {
    throw "Source file was not found: $Source"
}

Move-Item -Path $Source -Destination $Destination -Force
Write-Host "File moved to quarantine: $Destination" -ForegroundColor Yellow
Get-ChildItem "C:\SOC-Lab\Quarantine"
