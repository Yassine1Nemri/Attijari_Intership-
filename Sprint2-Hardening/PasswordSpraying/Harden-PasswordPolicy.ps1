Import-Module ActiveDirectory
Write-Host "[+] Application de la strategie de mot de passe (baseline Windows)..." -ForegroundColor Cyan

Set-ADDefaultDomainPasswordPolicy -Identity (Get-ADDomain).DistinguishedName `
    -ComplexityEnabled $true `
    -MinPasswordLength 14 `
    -PasswordHistoryCount 24 `
    -ReversibleEncryptionEnabled $false `
    -LockoutDuration ([TimeSpan]::FromMinutes(15)) `
    -LockoutObservationWindow ([TimeSpan]::FromMinutes(15)) `
    -LockoutThreshold 10

Write-Host "[+] Nouvelle strategie :" -ForegroundColor Green
Get-ADDefaultDomainPasswordPolicy | Format-List