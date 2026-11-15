---
name: diagnostic-reseau
description: Diagnostiquer un problème réseau ou internet - pas de connexion, Wi-Fi lent ou instable, box, DNS, IP, VPN, partage de fichiers, imprimante réseau, site inaccessible. À utiliser dès qu'il est question de connexion ou de réseau.
---

# Diagnostic réseau

Toujours remonter les couches dans l'ordre, du plus proche au plus lointain. S'arrêter à la première couche qui échoue : c'est là qu'est la panne.

## Ordre du diagnostic
1. **Le symptôme exact** : tous les appareils ou un seul ? Wi-Fi ou câble ? Depuis quand ? Qu'est-ce qui a changé ?
2. **Lien physique** : câble, voyants de la box, Wi-Fi activé, mode avion.
3. **Adresse IP** : l'appareil a-t-il une IP valide ? Une IP en 169.254.x.x = pas de réponse DHCP de la box.
   - Windows : `ipconfig /all` · Mac : `ifconfig` ou Réglages → Réseau · Linux : `ip a`
4. **Passerelle (box)** : `ping <IP de la box>` (souvent 192.168.1.1 ou 192.168.0.1). Échec = problème local (Wi-Fi, câble, box).
5. **Internet par IP** : `ping 1.1.1.1`. Échec = box ou fournisseur d'accès.
6. **DNS** : `nslookup google.com` (ou `dig google.com`). IP OK mais DNS en échec → changer de DNS (1.1.1.1, 8.8.8.8) ou redémarrer la box.
7. **Le service lui-même** : `curl -I https://site` ; vérifier sur un site de statut si le service est en panne pour tout le monde.

## Cas fréquents
- **Wi-Fi lent** : distance, murs, canal saturé (passer en 5 GHz ou changer de canal), trop d'appareils, test de débit au câble pour comparer.
- **Un seul appareil** : oublier le réseau Wi-Fi et se reconnecter, mettre à jour le pilote, réinitialiser la pile réseau (Windows : `netsh winsock reset` puis redémarrer).
- **VPN** : tester sans le VPN ; vérifier qu'il ne bloque pas le réseau local.
- **Partage / imprimante** : même sous-réseau ? Pare-feu ? Découverte réseau activée (Windows) ?

## Règles
- Proposer les commandes une par une et lire le résultat avant la suivante.
- Avant un redémarrage ou une réinitialisation de la box, prévenir l'utilisateur (coupure pour tous les appareils, réglages perdus en cas de réinitialisation usine).
