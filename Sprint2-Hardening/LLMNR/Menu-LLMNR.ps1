Clear-Host
Write-Host "================ Hardening contre empoisonnement LLMNR/NBT-NS ================" -ForegroundColor Green
Write-Host "1:Lancer la detection"
Write-Host "2:Desactiver netbios sur toutes les machines du domaine"
Write-Host "3:Desactiver LLMNR sur toutes les machines du domaine"
Write-Host "================================================================" -ForegroundColor Green
Write-Host "***** Il est recommande de desactiver les protocoles NETBIOS et LLMNR *****" -ForegroundColor Yellow
Write-Host "----------------------------------------------------------------"
Write-Host "Q:POUR QUITER"
$choice = Read-Host "Choisissez une option "

switch ($choice) {
    "3" { & "C:\Hardening\Disable-LLMNR.ps1" }
    "2" { & "C:\Hardening\Disable-NetBIOS.ps1" }
    "1" { . "C:\Hardening\Conveigh.ps1"; Invoke-Conveigh }
    { $_ -in "Q","q" } { return }
    default { Write-Host "Choix invalide" -ForegroundColor Red }
}