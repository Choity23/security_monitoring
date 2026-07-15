# Run in Windows PowerShell as Administrator.
$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force "C:\SOC-Lab\Monitored" | Out-Null
New-Item -ItemType Directory -Force "C:\SOC-Lab\Quarantine" | Out-Null

Get-Service wazuh
Restart-Service -Name wazuh
Start-Sleep -Seconds 5
Get-Service wazuh

Write-Host "SOC lab folders are ready:" -ForegroundColor Green
Get-ChildItem "C:\SOC-Lab"
