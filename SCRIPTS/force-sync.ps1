# Force Microsoft Entra ID Sync

Import-Module ADSync

Write-Host "Starting Delta Sync..." -ForegroundColor Green

Start-ADSyncSyncCycle -PolicyType Delta

Write-Host "Sync Complete." -ForegroundColor Cyan