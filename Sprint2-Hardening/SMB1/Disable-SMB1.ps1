Write-Host "[+] Desactivation de SMBv1 sur le serveur local..." -ForegroundColor Cyan
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart

Import-Module ActiveDirectory
$computers = Get-ADComputer -Filter *
foreach ($c in $computers) {
    Write-Host "[+] Desactivation de SMBv1 sur $($c.Name)..." -ForegroundColor Cyan
    try {
        Invoke-Command -ComputerName $c.Name -ScriptBlock {
            Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart
        } -ErrorAction Stop
        Write-Host "    -> OK (redemarrage requis)" -ForegroundColor Green
    } catch {
        Write-Host "    -> Echec : $($_.Exception.Message)" -ForegroundColor Red
    }
}
Write-Host "`n[!] Un redemarrage est necessaire pour finaliser la desactivation." -ForegroundColor Yellow