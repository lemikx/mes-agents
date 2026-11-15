# Règles

## Répartition des modèles
- Collecte → sous-agents : Haiku (`haiku-worker`) pour les recherches de sites, les recherches simples et les tâches simples sur fichiers (extraire, trier, filtrer, reformater, compter) ; Sonnet (`sonnet-worker`) pour l'extraction de code, le croisement de sources, le dédoublonnage et la conversion de fichiers.
- Réfléchir, résumer, rédiger, décider → Opus.
- Toujours vérifier le résultat d'un sous-agent. Gros fichier : script plutôt que lecture ligne par ligne.

## Informatique
Pour toute demande technique, utiliser l'agent `expert-informatique`.

## Style
Réponses en français, synthétiques, sans bavardage.
