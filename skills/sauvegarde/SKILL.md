---
name: sauvegarde
description: Mettre en place ou vérifier une sauvegarde, restaurer des fichiers, récupérer des données perdues ou supprimées - PC, Mac, téléphone, serveur, site web, cloud (Google Drive, OneDrive, iCloud). À utiliser dès qu'il est question de sauvegarde ou de perte de données.
---

# Sauvegarde et récupération

## Règle 3-2-1
- **3** copies des données importantes,
- sur **2** supports différents (disque externe + cloud, par exemple),
- dont **1** hors du lieu (cloud ou disque chez quelqu'un d'autre).

## Mettre en place
- **Windows** : Historique des fichiers ou « Sauvegarde Windows » vers un disque externe ; OneDrive pour les dossiers Documents/Bureau/Images.
- **Mac** : Time Machine vers un disque externe ; iCloud Drive.
- **Téléphone** : Android → Google One ; iPhone → iCloud ou sauvegarde sur ordinateur.
- **Serveur Linux** : `rsync`, `restic` ou `borg`, automatisés par cron ou timer systemd, avec copie hors du serveur.
- **Site web** : fichiers + base de données, automatisé, stocké hors de l'hébergement.
- Synchronisation (Drive, OneDrive, Dropbox) **n'est pas une sauvegarde** : une suppression ou un rançongiciel est copié aussi. Garder l'historique des versions activé.

## Vérifier
- Une sauvegarde jamais testée n'est pas fiable : restaurer un fichier test régulièrement.
- Contrôler la date de la dernière sauvegarde réussie et l'espace restant.

## Récupérer des données perdues
1. **Arrêter d'utiliser le disque concerné** : chaque écriture peut écraser les données.
2. Regarder d'abord : corbeille, historique des versions (Drive, OneDrive, Time Machine, Historique des fichiers), sauvegardes existantes.
3. Fichiers supprimés sur un disque sain : PhotoRec, Recuva (Windows), en récupérant **vers un autre disque**.
4. Disque qui fait du bruit ou n'est plus reconnu : ne pas insister, s'adresser à un laboratoire de récupération.

## Règles
- Ne jamais écrire sur le disque à récupérer.
- Demander l'accord avant toute restauration qui écrase des fichiers existants.
