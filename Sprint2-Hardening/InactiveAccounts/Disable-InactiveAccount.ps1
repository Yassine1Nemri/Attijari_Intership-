Add-Type -AssemblyName Microsoft.VisualBasic
Import-Module ActiveDirectory

$user = [Microsoft.VisualBasic.Interaction]::InputBox('SamAccountName du compte a desactiver', 'INFO')
Disable-ADAccount -Identity $user
Write-Host "[+] Compte '$user' desactive." -ForegroundColor Green
Get-ADUser -Identity $user -Properties Enabled | Select-Object Name, Enabled