Add-Type -AssemblyName Microsoft.VisualBasic
$name = [Microsoft.VisualBasic.Interaction]::InputBox('Nom du compte honeypot a surveiller', 'INFO')
$since = (Get-Date).AddHours(-24)

Write-Host "[+] Recherche de demandes de tickets TGS (4769) pour '$name'..." -ForegroundColor Cyan
Get-WinEvent -FilterHashtable @{ LogName = 'Security'; Id = 4769; StartTime = $since } -ErrorAction SilentlyContinue |
    Where-Object { $_.Message -match [regex]::Escape($name) } |
    Select-Object TimeCreated, @{Name="Details";Expression={$_.Message}} |
    Format-List

Write-Host "`n[!] Toute occurrence ci-dessus = alerte forte, ce SPN ne devrait jamais etre demande." -ForegroundColor Yellow