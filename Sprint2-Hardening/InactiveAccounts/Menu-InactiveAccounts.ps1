Clear-Host
Write-Host "================ Gestion des comptes inactifs ================" -ForegroundColor Green
Write-Host "1:Verifier les comptes inactifs depuis N jours"
Write-Host "2:Desactiver un compte inactif"
Write-Host "================================================================" -ForegroundColor Green
Write-Host "Q:POUR QUITER"
$choice = Read-Host "Choisissez une option "

switch ($choice) {
    "1" { & "C:\Hardening\Get-InactiveAccounts.ps1" }
    "2" { & "C:\Hardening\Disable-InactiveAccount.ps1" }
    { $_ -in "Q","q" } { return }
    default { Write-Host "Choix invalide" -ForegroundColor Red }
}