Add-Type -AssemblyName Microsoft.VisualBasic
Import-Module ActiveDirectory

$days = [Microsoft.VisualBasic.Interaction]::InputBox('Nombre de jours d''inactivite', 'INFO')

Write-Host "[+] Comptes inactifs depuis plus de $days jours :" -ForegroundColor Cyan
Search-ADAccount -AccountInactive -TimeSpan (New-TimeSpan -Days $days) -UsersOnly |
    Select-Object Name, SamAccountName, LastLogonDate, Enabled |
    Format-Table -AutoSize