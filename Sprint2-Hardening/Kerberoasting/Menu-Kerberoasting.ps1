Clear-Host
Write-Host "================ Hardening contre Kerberoasting ================" -ForegroundColor Green
Write-Host "1:Creer un compte de service Honeypot"
Write-Host "2:Verifier les tickets TGS demandes"
Write-Host "==================================================================" -ForegroundColor Green
Write-Host "Q:POUR QUITER"
$choice = Read-Host "Choisissez une option "

switch ($choice) {
    "1" { & "C:\Hardening\New-Honeypot.ps1" }
    "2" { & "C:\Hardening\Watch-Honeypot.ps1" }
    { $_ -in "Q","q" } { return }
    default { Write-Host "Choix invalide" -ForegroundColor Red }
}