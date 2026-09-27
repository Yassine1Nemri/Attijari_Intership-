Add-Type -AssemblyName Microsoft.VisualBasic
Import-Module ActiveDirectory
Add-Type -AssemblyName System.Web

$name = [Microsoft.VisualBasic.Interaction]::InputBox('Nom du compte honeypot (ex: svc_backup)', 'INFO')
$securePwd = [System.Web.Security.Membership]::GeneratePassword(24, 6) | ConvertTo-SecureString -AsPlainText -Force

New-ADUser -Name $name -SamAccountName $name -AccountPassword $securePwd `
    -Enabled $true -PasswordNeverExpires $true -Description "Compte honeypot - NE JAMAIS UTILISER"

$spn = "MSSQLSvc/fakehost.attijari.local:1433"
Set-ADUser -Identity $name -ServicePrincipalNames @{Add=$spn}

Write-Host "[+] Compte honeypot '$name' cree avec le SPN : $spn" -ForegroundColor Green
Get-ADUser -Identity $name -Properties ServicePrincipalNames | Select-Object SamAccountName, ServicePrincipalNames