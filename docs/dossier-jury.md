# Dossier de Projet — Le Petit Journal d'Orléans
**Titre Professionnel ASD TP-01414 — Niveau 6**

---

## 1. Compétences couvertes

| Compétence | Description | Couvert |
|------------|-------------|---------|
| CP2 | Automatiser le déploiement | ✅ GitHub Actions + Docker Hub |
| CP3 | Gérer le stockage | ✅ Volumes Docker + PVC K3s |
| CP4 | Sécuriser l'infrastructure | ✅ UFW + SSH hardening Ansible |
| CP5 | Environnement de test | ✅ docker-compose.test.yml |
| CP6 | Sauvegardes | ✅ scripts/backup.sh + CronJob K3s |
| CP7 | Gérer des containers | ✅ Docker Compose + Kubernetes |
| CP8 | Mise en production automatisée | ✅ Pipeline CI/CD + K3s |
| CP9 | Statistiques | ✅ Prometheus + node-exporter |
| CP10 | Supervision | ✅ Grafana dashboard |

---

## 2. Cahier des charges

Voir : [docs/cahier-des-charges.md](cahier-des-charges.md)

**Contexte client :** Le Petit Journal d'Orléans — média local fictif
- 3 journalistes, 15 000 visiteurs/mois, budget 100€/an
- Incident 1 : crash hébergeur sur pic de trafic → perte d'articles
- Incident 2 : mise à jour WordPress automatique → 2 jours de downtime invisible

---

## 3. Architecture technique

Voir : [docs/architecture.md](architecture.md)

**3 environnements :**
- **DEV** : `docker/docker-compose.yml` → port 8080
- **TEST** : `docker/docker-compose.test.yml` → port 8081
- **PROD** : Kubernetes K3s via Ansible + Terraform

**Stack technique :**
- WordPress 6.8-apache (version pinnée)
- MySQL 8.0
- Prometheus v2.51.0 + Grafana 10.4.2
- K3s (Kubernetes léger)
- Terraform 1.7+ / Ansible 2.14+
- GitHub Actions (CI/CD)

---

## 4. Démarche et outils

### Pourquoi Docker Compose avant Kubernetes
Docker Compose couvre les 3 compétences obligatoires (CP2, CP7, CP10)
en environnement local avant de passer à K3s. C'est un filet de sécurité :
si K3s dérape, le projet reste défendable au jury.

### Pourquoi K3s et pas Kubernetes complet
K3s est une distribution Kubernetes certifiée CNCF. Elle consomme 500 Mo
de RAM au lieu de 2 Go pour K8s standard. Sur 8 Go de RAM total avec
Windows 11 + WSL2, c'est le seul choix viable. Les manifests sont
identiques à K8s standard — kubectl, Deployments, Services, PVC.

### Pourquoi GitHub Actions et pas GitLab CI
Le code est sur GitHub. GitHub Actions est natif — pas de service externe
à configurer. 2000 minutes/mois gratuites, marketplace d'actions Docker
préconstruites, secrets chiffrés intégrés.

### Pourquoi pas de cloud payant
Le REAC autorise un cloud privé local. AWS Free Tier présente un risque
de facturation surprise (NAT Gateway = 35€/mois). Terraform + K3s en
local simule exactement les mêmes concepts sans risque financier.

---

## 5. Réalisations significatives

### 5.1 Dockerfile avec healthcheck
**Fichier :** `Dockerfile`
**Pourquoi c'est significatif :** Le healthcheck permet à Docker et
Kubernetes de détecter automatiquement si WordPress est down et de
redémarrer le container. C'est directement lié à l'incident de février
2026 où le site était down 2 jours sans que personne le sache.

### 5.2 Pipeline GitHub Actions
**Fichier :** `.github/workflows/deploy.yml`
**Pourquoi c'est significatif :** 3 jobs enchaînés — validate, smoke-test,
publish. L'image est taguée et poussée sur Docker Hub uniquement si les
tests passent. Le déploiement en prod est manuel (bouton) — prudence
professionnelle.

### 5.3 Dashboard Grafana provisionné automatiquement
**Fichier :** `docker/grafana/provisioning/dashboards/petit-journal-overview.json`
**Pourquoi c'est significatif :** Le dashboard se recharge automatiquement
au redémarrage via le provisioning. Les journalistes voient en temps réel
CPU, RAM, uptime — exactement ce qui manquait lors de l'incident.

### 5.4 Playbook Ansible idempotent
**Fichier :** `ansible/playbook.yml`
**Pourquoi c'est significatif :** Le playbook peut être relancé 100 fois
sans casser l'infrastructure. C'est le principe pro d'idempotence —
standard DevOps.

---

## 6. Situation de recherche

### Problème rencontré
Lors de la configuration de Prometheus pour scraper les métriques
node-exporter, le container node-exporter n'apparaissait pas dans
les targets Prometheus (`http://localhost:9090/targets`).

### Recherche effectuée
1. Lu les logs : `docker logs journal-prometheus` → erreur
   `connection refused` sur `node-exporter:9100`
2. Consulté la doc officielle Prometheus sur la configuration
   `scrape_configs` et les réseaux Docker
3. Identifié le problème : Prometheus et node-exporter étaient
   sur des réseaux Docker différents
4. Solution : ajouter les deux services au même réseau `monitoring`
   dans `docker-compose.monitoring.yml`

### Ce que j'ai appris
Les containers Docker ne se voient que s'ils partagent le même réseau.
Le nom du service dans docker-compose.yml devient son DNS interne.
`node-exporter:9100` fonctionne uniquement si les deux containers
sont sur le même réseau nommé.

---

## Liens du projet

| Ressource | Lien |
|-----------|------|
| GitHub | https://github.com/hajardh01-gif/projet-asd-wordpress |
| Docker Hub | https://hub.docker.com/r/hajardh01/wordpress-asd |
| WordPress local | http://localhost:8080 |
| Grafana local | http://localhost:3000 |
| Prometheus local | http://localhost:9090 |