#!/bin/bash
set -euo pipefail

BACKUP_FILE="${1:-}"
DB_CONTAINER="${DB_CONTAINER:-db}"
DB_NAME="${DB_NAME:-wordpress}"
DB_USER="${DB_USER:-wordpress}"

[ -z "$BACKUP_FILE" ] && echo "Usage: ./restore.sh <fichier.sql.gz>" && exit 1
[ ! -f "$BACKUP_FILE" ] && echo "Fichier introuvable : $BACKUP_FILE" && exit 1
[ -z "${DB_PASSWORD:-}" ] && echo "DB_PASSWORD requis" && exit 1

echo "Restauration depuis $BACKUP_FILE..."
gunzip -c "$BACKUP_FILE" | docker exec -i "$DB_CONTAINER" mysql \
  -u "$DB_USER" \
  -p"$DB_PASSWORD" \
  "$DB_NAME"

echo "Restauration terminee"