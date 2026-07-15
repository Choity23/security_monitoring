# Run in Windows PowerShell as Administrator after FIM synchronization.
$ErrorActionPreference = "Stop"
$TestFile = "C:\SOC-Lab\Monitored\demo.txt"

Set-Content -Path $TestFile -Value "Wazuh FIM Test"
Write-Host "Created: $TestFile"
Start-Sleep -Seconds 5

Add-Content -Path $TestFile -Value "File Modified"
Write-Host "Modified: $TestFile"
Start-Sleep -Seconds 5

Remove-Item $TestFile -Force
Write-Host "Deleted: $TestFile"
Start-Sleep -Seconds 5

Write-Host "FIM creation, modification, and deletion tests completed." -ForegroundColor Green
