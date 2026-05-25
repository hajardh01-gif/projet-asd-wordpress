# Rapport de Tests — Le Petit Journal d'Orléans

## Pipeline CI/CD — GitHub Actions

### Tests automatisés — 3 stages
| Étape | Vérification | Résultat |
|-------|--------------|----------|
| validation | Vérification Docker Compose DEV | ✅ Réussi |
| validation | Vérification Docker Compose TEST | ✅ Réussi |
| smoke-test | Réponse HTTP WordPress | ✅ Réussi |
| smoke-test | Connexion MySQL | ✅ Réussi |
| publication | Build image Docker | ✅ Réussi |
| publication | Push Docker Hub | ✅ Réussi |
### Couverture fonctionnelle

| Fonctionnalité | Testé | Méthode |
|----------------|-------|---------|
| Démarrage WordPress | ✅ | smoke-test CI |
| Connexion MySQL | ✅ | smoke-test CI |
| Build image Docker | ✅ | pipeline publish |
| Push Docker Hub | ✅ | pipeline publish |
| Validation YAML | ✅ | pipeline validate |
| Alertes Prometheus | ✅ | test manuel AlertManager |
| Backup MySQL | ✅ | test manuel scripts/backup.sh |
| Restauration MySQL | ✅ | test manuel scripts/restore.sh |

### Résultat pipeline GitHub Actions
- Lien : https://github.com/hajardh01-gif/projet-asd-wordpress/actions
- Derniers runs : tous ✅ sauf workflow Fly.io (en correction)

## Tests manuels effectués

### Test AlertManager email
- Action : envoi alerte via API v2
- Résultat : email reçu dans Gmail en moins d'1 minute ✅
- Screenshot : docs/email-alerte-recu.png

### Test backup/restore MySQL
- Action : `./scripts/backup.sh`
- Résultat : fichier .sql.gz créé dans backups/ ✅
- Rotation 7 jours : fonctionnelle ✅

### Test Terraform Fly.io
- Action : `terraform apply`
- Résultat : IP publique 188.93.146.133 provisionnée ✅
- Screenshot : docs/terraform-apply.png