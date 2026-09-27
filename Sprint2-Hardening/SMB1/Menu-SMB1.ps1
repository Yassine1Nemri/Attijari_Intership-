Clear-Host
Write-Host "================ Hardening contre deni de service (SMBv1) ================" -ForegroundColor Green
Write-Host "1:Detecter les postes utilisant SMBv1"
Write-Host "2:Desactiver SMBv1 sur toutes les machines du domaine"
Write-Host "==========================================================================" -ForegroundColor Green
Write-Host "Q:POUR QUITER"
$choice = Read-Host "Choisissez une option "

switch ($choice) {
    "1" { & "C:\Hardening\Test-SMB1.ps1" }
    "2" { & "C:\Hardening\Disable-SMB1.ps1" }
    { $_ -in "Q","q" } { return }
    default { Write-Host "Choix invalide" -ForegroundColor Red }
}