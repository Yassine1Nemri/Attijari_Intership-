Add-Type -AssemblyName System.Web
Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -AssemblyName Microsoft.VisualBasic
Import-Module ActiveDirectory

$DC=[Microsoft.VisualBasic.Interaction]::InputBox('Unité Organisationelle', 'INFO')
$DC1=[Microsoft.VisualBasic.Interaction]::InputBox('Entrer le nom de domaine', 'INFO')

$OU = "DC=$DC,DC=$DC1"

$timeoutSeconds = 100

$ComputerNames = Get-ADComputer -Filter * -SearchBase "$OU" | Select Name

FOREACH ($Computer in $ComputerNames) {
    if (Test-Connection -ComputerName $($Computer).Name -Count 1 -TimeToLive $timeoutSeconds -ErrorAction 0) {
        Write-Host $Computer.Name -ForegroundColor Green
        Invoke-command -Computer $Computer.Name -ScriptBlock {
            $adapters = gwmi win32_networkadapterconfiguration
            Foreach ($adapter in $adapters) {
                Write-Host $adapter
                $adapter.settcpipnetbios(2)
            }
        }
    }
    else {
        [System.Windows.MessageBox]::Show($Computer.Name,'Le poste est déconnecté ','OK','Warning')
    }
}