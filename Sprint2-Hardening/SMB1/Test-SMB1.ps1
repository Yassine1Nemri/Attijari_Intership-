Write-Host "[+] Verification sur le serveur local..." -ForegroundColor Cyan
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object FeatureName, State

Import-Module ActiveDirectory
$computers = Get-ADComputer -Filter *
foreach ($c in $computers) {
    Write-Host "`n[+] Verification sur $($c.Name)..." -ForegroundColor Cyan
    try {
        Invoke-Command -ComputerName $c.Name -ScriptBlock {
            Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object FeatureName, State
        } -ErrorAction Stop
    } catch {
        Write-Host "    -> Injoignable : $($_.Exception.Message)" -ForegroundColor Red
    }
}