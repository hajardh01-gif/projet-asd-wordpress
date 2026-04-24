#!/bin/bash
set -euo pipefail

BACKUP_DIR="${BACKUP_DIR:-./backups}"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
DB_CONTAINER="${DB_CONTAINER:-db}"
DB_NAME="${DB_NAME:-wordpress}"
DB_USER="${DB_USER:-wordpress}"

[ -z "${DB_PASSWORD:-}" ] && echo "DB_PASSWORD requis" && exit 1

mkdir -p "$BACKUP_DIR"

echo "Backup demarre a $DATE"
docker exec "$DB_CONTAINER" mysqldump \
  -u "$DB_USER" \
  -p"$DB_PASSWORD" \
  --single-transaction \
  --quick \
  "$DB_NAME" | gzip > "$BACKUP_DIR/wordpress_${DATE}.sql.gz"

find "$BACKUP_DIR" -name "wordpress_*.sql.gz" -mtime +7 -delete

echo "Backup termine : $BACKUP_DIR/wordpress_${DATE}.sql.gz"