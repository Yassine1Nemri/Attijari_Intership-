Clear-Host
Write-Host "================ Hardening contre Password Spraying ================" -ForegroundColor Green
Write-Host "1:Tester la robustesse des mots de passe"
Write-Host "2:Detecter les mauvaises tentatives de connexion"
Write-Host "3:Obliger un utilisateur a changer son mot de passe"
Write-Host "4:Durcir la strategie de mot de passe / verrouillage"
Write-Host "======================================================" -ForegroundColor Green
Write-Host "Q:POUR QUITER"
$choice = Read-Host "Choisissez une option "

switch ($choice) {
    "2" { & "C:\Hardening\Detect-FailedLogons.ps1" }
    "3" { & "C:\Hardening\Force-PasswordChange.ps1" }
    "4" { & "C:\Hardening\Harden-PasswordPolicy.ps1" }
    { $_ -in "Q","q" } { return }
    default { Write-Host "Choix invalide" -ForegroundColor Red }
}