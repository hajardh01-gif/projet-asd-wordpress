# Script de démo — Soutenance ASD

## 1. Montrer WordPress (2 min)
- Ouvrir http://localhost:8080
- Montrer l'admin http://localhost:8080/wp-admin

## 2. Montrer Grafana (2 min)
- Ouvrir http://localhost:3000
- Montrer le dashboard "Petit Journal Overview"
- Expliquer les 4 panels (CPU, RAM, Uptime, Node Exporter)

## 3. Déclencher une alerte (3 min)
```powershell
docker stop wordpress
```
- Attendre 2 minutes
- Montrer http://localhost:9090/alerts → WordPressDown en rouge
- Montrer http://localhost:9093 → alerte active
- Montrer l'email reçu sur Gmail
```powershell
docker start wordpress
```

## 4. Montrer Terraform Fly.io (2 min)
- Montrer docs/terraform-apply.png
- Montrer https://fly.io/apps/projet-asd-wordpress
- Expliquer : "Terraform a créé la VM en CDG Paris"

## 5. Montrer Kubernetes (2 min)
```bash
kubectl get pods -A
kubectl get svc -A
```

## 6. Montrer le pipeline CI/CD (2 min)
- Ouvrir GitHub Actions
- Montrer les 3 stages : build → publish → test
- Montrer l'image sur Docker Hub

## 7. Montrer le backup (1 min)
```bash
./scripts/backup.sh
ls -lh backups/
```

## Phrases clés pour le jury

**Pourquoi Fly.io ?**
"Fly.io est un vrai cloud avec VMs réelles et IP publique. 
Gratuit sans CB. Région CDG Paris pour minimiser la latence."

**Pourquoi K3s ?**
"K3s est Kubernetes certifié CNCF. Même API, mêmes manifests 
que K8s standard. 500Mo RAM au lieu de 2Go."

**Si le serveur tombe à 3h du matin ?**
"Grafana m'envoie une alerte email. Le CronJob K8s a fait 
un backup à 2h. Je restaure avec restore.sh en 15 minutes."