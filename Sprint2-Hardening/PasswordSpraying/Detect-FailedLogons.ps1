$since = (Get-Date).AddHours(-24)
Write-Host "[+] Echecs de connexion (Event ID 4625) sur les 24 dernieres heures..." -ForegroundColor Cyan

Get-WinEvent -FilterHashtable @{ LogName = 'Security'; Id = 4625; StartTime = $since } -ErrorAction SilentlyContinue |
    ForEach-Object {
        [PSCustomObject]@{
            Time     = $_.TimeCreated
            Account  = $_.Properties[5].Value
            SourceIP = $_.Properties[19].Value
        }
    } |
    Group-Object Account |
    Sort-Object Count -Descending |
    Format-Table Name, Count -AutoSize