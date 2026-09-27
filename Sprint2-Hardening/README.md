# Sprint 2 – Durcissement du serveur Active Directory

Scripts PowerShell développés pour durcir un serveur AD contre les attaques étudiées au Sprint 1 (LLMNR/NBT-NS poisoning, SMBv1/EternalBlue, Password Spraying, Kerberoasting).

## Structure

- `LLMNR/` – détection et désactivation de LLMNR/NetBIOS
- `SMB1/` – détection et désactivation de SMBv1
- `PasswordSpraying/` – détection des échecs de connexion, durcissement de la stratégie de mot de passe
- `Kerberoasting/` – compte honeypot et surveillance des tickets TGS
- `InactiveAccounts/` – gestion des comptes AD inactifs

## Usage

Chaque dossier contient un script `Menu-*.ps1` servant de point d'entrée.
