Add-Type -AssemblyName Microsoft.VisualBasic
Import-Module ActiveDirectory

$user = [Microsoft.VisualBasic.Interaction]::InputBox('Entrer le SamAccountName du compte', 'INFO')
Set-ADUser -Identity $user -ChangePasswordAtLogon $true
Write-Host "[+] Le compte '$user' devra changer son mot de passe a la prochaine connexion." -ForegroundColor Green