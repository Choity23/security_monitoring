param(
    [string]$TestFile = "C:\SOC-Lab\Monitored\demo.txt",
    [ValidateRange(1, 120)]
    [int]$DelaySeconds = 5
)

$ErrorActionPreference = "Stop"
$parent = Split-Path -Parent $TestFile

if (-not (Test-Path $parent)) {
    throw "The monitored directory does not exist: $parent"
}

Write-Host "[1/3] Creating $TestFile"
Set-Content -Path $TestFile -Value "Wazuh FIM Test"
Start-Sleep -Seconds $DelaySeconds

Write-Host "[2/3] Modifying $TestFile"
Add-Content -Path $TestFile -Value "File Modified"
Start-Sleep -Seconds $DelaySeconds

Write-Host "[3/3] Deleting $TestFile"
Remove-Item -Path $TestFile
Start-Sleep -Seconds $DelaySeconds

Write-Host "FIM test events completed. Review Wazuh rules 554, 550, and 553."
