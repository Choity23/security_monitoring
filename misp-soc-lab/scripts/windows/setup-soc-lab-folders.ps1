# Run PowerShell as Administrator.
$ErrorActionPreference = "Stop"

$folders = @(
    "C:\SOC-Lab\Monitored",
    "C:\SOC-Lab\Quarantine"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
    Write-Host "Ready: $folder"
}

Get-ChildItem "C:\SOC-Lab"
