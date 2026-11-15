---
name: admin-linux
description: Administrer un serveur ou poste Linux - services systemd, utilisateurs et droits, paquets, disque, journaux, pare-feu, SSH, tâches planifiées cron, mises à jour, performances. À utiliser dès qu'il s'agit d'une machine Linux.
---

# Administration Linux

## État des lieux (lecture seule, sans risque)
- Système : `cat /etc/os-release`, `uname -a`, `uptime`
- Ressources : `free -h`, `df -h`, `du -sh /* 2>/dev/null | sort -h`, `top` ou `htop`
- Services : `systemctl status <service>`, `systemctl --failed`
- Journaux : `journalctl -u <service> -n 100 --no-pager`, `journalctl -p err -b`
- Réseau : `ip a`, `ss -tulpn`
- Connexions : `last`, `who`

## Opérations courantes
- Paquets (Debian/Ubuntu) : `apt update && apt list --upgradable` puis `apt upgrade` ; (RHEL/Fedora) : `dnf upgrade`.
- Services : `systemctl restart|enable|disable <service>`.
- Utilisateurs : `adduser`, `usermod -aG <groupe> <user>`, `passwd`.
- Droits : `ls -l`, `chown`, `chmod` (jamais de `chmod 777`).
- Tâches planifiées : `crontab -l`, `crontab -e`, ou timers systemd.
- Pare-feu : `ufw status` / `firewall-cmd --list-all`.

## Sécurité SSH
- Connexion par clé, `PasswordAuthentication no`, `PermitRootLogin no` dans `/etc/ssh/sshd_config`.
- **Avant de modifier SSH ou le pare-feu à distance : garder une session ouverte et tester une nouvelle connexion**, sinon risque de s'enfermer dehors.
- fail2ban pour bloquer les attaques par force brute.

## Règles
- Commencer toujours par les commandes en lecture seule.
- Sauvegarder un fichier de configuration avant de le modifier (`cp fichier fichier.bak`).
- Demander l'accord avant : `rm -rf`, redémarrage d'un serveur en production, modification SSH/pare-feu, mise à jour majeure de version.
- Ne jamais afficher de mot de passe, de clé privée ou de contenu de fichier `.env`.
