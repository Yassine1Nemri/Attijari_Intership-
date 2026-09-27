Add-Type -AssemblyName System.Web
Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -AssemblyName Microsoft.VisualBasic
Import-Module ActiveDirectory
try{
$DC=[Microsoft.VisualBasic.Interaction]::InputBox('Unité Organisationelle', 'INFO')
$DC1=[Microsoft.VisualBasic.Interaction]::InputBox('Entrer le nom de domaine', 'INFO')

$OU = "DC=$DC,DC=$DC1"

$timeoutSeconds = 20

$ComputerNames = Get-ADComputer -Filter * -SearchBase "$OU" | Select Name

FOREACH ($Computer in $ComputerNames) {
    if (Test-Connection -ComputerName $($Computer).Name -Count 1 -TimeToLive $timeoutSeconds -ErrorAction 0) {
        Write-Host $Computer.Name -ForegroundColor Green
        Invoke-command -COMPUTER $Computer.Name -ScriptBlock {
    REG add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v EnableMulticast /t REG_DWORD /d 0 /f
        }
    }
    else {
        [System.Windows.MessageBox]::Show($Computer.Name,'Le Poste est déconnecté ','OK','Warning')
    }
}
}
catch{[System.Windows.Forms.MessageBox]::Show('Verifier les informations que vous avez entrées', 'ERROR', 'OK', 'Stop')}
