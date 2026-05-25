# Guide de Déploiement — Le Petit Journal d'Orléans

## Prérequis
- Docker Desktop installé
- WSL2 Ubuntu 22.04
- Terraform >= 1.7.0
- flyctl installé

## Déploiement local (DEV)

```bash
cp docker/.env.example docker/.env
# Remplir les mots de passe dans .env
docker compose -f docker/docker-compose.yml up -d
```

WordPress accessible sur http://localhost:8080

## Déploiement supervision

```bash
docker compose -f docker/docker-compose.monitoring.yml up -d
```

- Grafana : http://localhost:3000
- Prometheus : http://localhost:9090
- AlertManager : http://localhost:9093

## Déploiement cloud Fly.io

```bash
cd terraform
terraform init
terraform apply
```

IP publique générée automatiquement dans ansible/inventory.ini

## Pipeline CI/CD

Chaque push sur main déclenche automatiquement :
1. Validation des fichiers Docker Compose
2. Smoke-test WordPress + MySQL
3. Build et push image Docker Hub

Lien pipeline : https://github.com/hajardh01-gif/projet-asd-wordpress/actions