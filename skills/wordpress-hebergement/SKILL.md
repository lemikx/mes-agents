---
name: wordpress-hebergement
description: Gérer un site web - WordPress (erreurs, extensions, thèmes, lenteur, piratage, mises à jour), hébergement, nom de domaine, DNS, certificat HTTPS, e-mails du domaine, référencement technique. À utiliser dès qu'un site web est concerné.
---

# Site web, WordPress et hébergement

## Diagnostic d'un site en panne
1. Le site répond-il ? `curl -I https://site` : code 200 OK, 3xx redirection, 4xx page ou accès, 5xx erreur serveur.
2. Le domaine pointe-t-il au bon endroit ? `dig site +short`, `dig site NS +short`. Domaine expiré ?
3. Certificat HTTPS valide ? Date d'expiration ; Let's Encrypt chez l'hébergeur.
4. Hébergeur en panne ? Page de statut de l'hébergeur.

## WordPress
- **Erreur critique / page blanche** : activer `WP_DEBUG` dans `wp-config.php` ; lire `wp-content/debug.log` ; désactiver les extensions en renommant `wp-content/plugins` puis les réactiver une par une.
- **Lenteur** : extension de cache, compression des images, trop d'extensions, version de PHP récente, hébergement trop faible.
- **Mises à jour** : sauvegarde d'abord ; WordPress, thèmes et extensions à jour ; supprimer ce qui n'est pas utilisé.
- **Piratage suspecté** : sauvegarde de l'état actuel, changement de tous les mots de passe (admin, FTP, base de données, hébergeur), analyse (Wordfence), comparaison avec des fichiers WordPress d'origine, restauration d'une sauvegarde saine.
- WP-CLI si disponible : `wp core version`, `wp plugin list`, `wp core verify-checksums`.

## Domaine et e-mails
- Enregistrements DNS : A/AAAA (site), CNAME, MX (e-mails), TXT (SPF, DKIM, DMARC contre le spam).
- Un changement DNS peut prendre quelques heures à se propager.

## Référencement technique
- HTTPS partout, site rapide, mobile, `sitemap.xml`, `robots.txt`, titres et descriptions uniques, Google Search Console.

## Règles
- Sauvegarde complète (fichiers + base de données) avant toute modification.
- Demander l'accord avant : mise à jour majeure, suppression, changement DNS, migration d'hébergeur.
- Ne jamais afficher les identifiants de `wp-config.php`.
