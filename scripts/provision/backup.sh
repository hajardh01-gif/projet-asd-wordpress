#!/bin/bash
# Script de sauvegarde MySQL - Projet ASD WordPress
# Auteur : hajardh01-gif
# Date : Avril 2026

set -euo pipefail

# Variables
DATE=$(date +%F)
BACKUP_DIR="/backups"
CONTAINER_NAME="docker-db-1"

# Créer le dossier de sauvegarde
mkdir -p $BACKUP_DIR

echo "Début de la sauvegarde - $DATE"

# Sauvegarde MySQL
docker exec $CONTAINER_NAME mysqldump \
  -u wordpress \
  -p${DB_PASSWORD} \
  wordpress > $BACKUP_DIR/wordpress_$DATE.sql

echo "Sauvegarde terminée : $BACKUP_DIR/wordpress_$DATE.sql"

# Supprimer les sauvegardes de plus de 7 jours
find $BACKUP_DIR -name "*.sql" -mtime +7 -delete

echo "Rotation des sauvegardes effectuée"