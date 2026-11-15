---
name: depannage-windows-mac
description: Dépanner un ordinateur Windows ou Mac - lenteur, plantage, écran bleu, démarrage impossible, disque plein, pilotes, mises à jour, logiciel qui ne s'ouvre pas, virus suspecté. À utiliser dès qu'un PC ou un Mac pose problème.
---

# Dépannage Windows et Mac

## Avant tout
- Système et version exacts, message d'erreur exact (photo ou copie), ce qui a changé récemment (mise à jour, logiciel installé, chute, coupure de courant).
- Si des données importantes ne sont pas sauvegardées : **sauvegarder d'abord** (voir skill `sauvegarde`).

## Lenteur
1. Gestionnaire des tâches (Windows : Ctrl+Maj+Échap) / Moniteur d'activité (Mac) : qui consomme le processeur, la mémoire, le disque ?
2. Espace disque : moins de 10 % libre ralentit tout. Windows : Paramètres → Stockage ; Mac : Réglages → Général → Stockage.
3. Programmes au démarrage : Windows : Gestionnaire des tâches → Démarrage ; Mac : Réglages → Général → Ouverture.
4. Santé du disque : Windows `wmic diskdrive get status` ou CrystalDiskInfo ; Mac : Utilitaire de disque → S.O.S.
5. Matériel ancien avec disque dur mécanique : un SSD est souvent la meilleure amélioration.

## Plantages et écran bleu
- Windows : noter le code d'arrêt ; Observateur d'événements ; `sfc /scannow` puis `DISM /Online /Cleanup-Image /RestoreHealth` (invite de commandes administrateur).
- Mac : Console → Rapports de plantage ; démarrer en mode sans échec ; Utilitaire de disque.
- Mémoire : Windows « Diagnostic de mémoire » ; Mac : Diagnostics Apple (touche D au démarrage).
- Pilotes : rouvrir le dernier pilote mis à jour, revenir à la version précédente.

## Démarrage impossible
- Windows : réparation automatique, mode sans échec, point de restauration.
- Mac : mode sans échec (Maj), récupération macOS (Cmd+R ou bouton d'alimentation maintenu sur puce Apple).

## Virus suspecté
- Windows : Microsoft Defender analyse complète + analyse hors ligne ; Malwarebytes en second avis.
- Mac : vérifier les éléments de connexion, les profils (Réglages → Confidentialité → Profils), les extensions du navigateur.
- Changer les mots de passe importants depuis un autre appareil sain.

## Règles
- Demander l'accord avant : réinitialisation, réinstallation, formatage, désinstallation, modification du registre.
- Expliquer chaque étape simplement, une à la fois.
