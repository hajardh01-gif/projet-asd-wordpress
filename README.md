# 🚀 Le Petit Journal d'Orléans – DevOps WordPress

Projet réalisé dans le cadre du **Titre Professionnel Administrateur Systèmes DevOps (ASD)**.

Ce projet met en œuvre une infrastructure DevOps permettant de déployer automatiquement une application **WordPress** conteneurisée avec **Docker**, orchestrée par **Kubernetes (Docker Desktop)**, supervisée par **Prometheus** et **Grafana**, avec des notifications automatiques via **Alertmanager**.

---

# 🎯 Vision du projet

L'objectif est de construire une plateforme DevOps moderne permettant :

- le déploiement automatisé d'une application WordPress ;
- l'intégration continue (CI) avec GitHub Actions ;
- la publication d'images Docker sur Docker Hub ;
- l'orchestration avec Kubernetes ;
- la supervision en temps réel ;
- la notification automatique des incidents par e-mail ;
- une infrastructure facilement reproductible.

---

# 📊 Statut du projet

| Composant | Statut |
|-----------|:------:|
| WordPress 6.8 + Apache | ✅ |
| MySQL 8 | ✅ |
| Docker Compose | ✅ |
| Kubernetes (Docker Desktop) | ✅ |
| GitHub Actions (CI) | ✅ |
| Image Docker Hub | ✅ |
| Prometheus | ✅ |
| Grafana | ✅ |
| Alertmanager (notifications Gmail) | ✅ |
| Node Exporter | ✅ |
| Healthcheck Docker | ✅ |
| Volumes persistants | ✅ |

---

# 🏗 Architecture

```text
                  GitHub
                     │
                 git push
                     │
                     ▼
             GitHub Actions
        Validation • Build • Tests
                     │
                     ▼
               Docker Hub
                     │
               docker pull
                     │
                     ▼
     Kubernetes (Docker Desktop)
                     │
      ┌──────────────┴──────────────┐
      │                             │
  WordPress                     MySQL
      │                             │
      └──────────────┬──────────────┘
                     │
             Persistent Volume
                     │
                     ▼
              Prometheus
                     │
                     ▼
              Alertmanager
                     │
          Notification Gmail
                     │
                     ▼
                Grafana
```

---

# ⚙ Technologies utilisées

- Docker
- Docker Compose
- Kubernetes (Docker Desktop)
- WordPress 6.8
- MySQL 8
- GitHub Actions
- Docker Hub
- Prometheus
- Grafana
- Alertmanager
- Node Exporter

---

# ✨ Fonctionnalités

- Déploiement conteneurisé de WordPress
- Base de données MySQL persistante
- Image Docker personnalisée avec Healthcheck
- Pipeline CI GitHub Actions
- Publication automatique sur Docker Hub
- Déploiement sur Kubernetes
- Supervision de l'infrastructure
- Alertes automatiques par e-mail
- Monitoring CPU, RAM, disque et disponibilité
- Volumes persistants pour les données

---

# 🐳 Image Docker

Disponible sur Docker Hub

```bash
docker pull hajardh01/wordpress-asd:latest
```

Docker Hub :

https://hub.docker.com/r/hajardh01/wordpress-asd

---

# 🚀 Déploiement local

## Cloner le projet

```bash
git clone https://github.com/hajardh01/projet-asd-wordpress.git
cd projet-asd-wordpress
```

Créer le fichier d'environnement

```bash
cp docker/.env.example docker/.env
```

Lancer Docker Compose

```bash
docker compose -f docker/docker-compose.yml up -d
```

---

# ☸ Déploiement sur Kubernetes (Docker Desktop)

Le projet est déployé sur le cluster Kubernetes intégré à **Docker Desktop**.

Appliquer les manifestes :

```bash
kubectl apply -f k8s/
```

Vérifier les Pods :

```bash
kubectl get pods
```

Vérifier les Services :

```bash
kubectl get svc
```

Accéder à l'application :

```
http://localhost:30080
```

---

# 🌐 Accès aux services

| Service | URL |
|----------|-----|
| WordPress | http://localhost:30080 |
| Administration WordPress | http://localhost:30080/wp-admin |
| Grafana | http://localhost:3000 |
| Prometheus | http://localhost:9090 |
| Alertmanager | http://localhost:9093 |

---

# 📊 Supervision

La supervision repose sur :

- Prometheus
- Grafana
- Node Exporter
- kube-state-metrics
- Alertmanager

Les métriques surveillées comprennent :

- utilisation CPU
- mémoire
- stockage
- disponibilité WordPress
- disponibilité MySQL
- état des Pods Kubernetes

---

# 🚨 Alertes

Alertmanager est configuré pour envoyer automatiquement des notifications Gmail lorsqu'une alerte critique est déclenchée.

Tests réalisés :

- ✅ création d'une alerte de test
- ✅ réception automatique d'un e-mail
- ✅ affichage dans Alertmanager
- ✅ gestion des alertes depuis l'interface Web

---

# 🔄 Pipeline CI

Chaque **push** sur la branche **main** déclenche automatiquement :

1. Validation Docker Compose
2. Build de l'image Docker
3. Publication sur Docker Hub
4. Vérification du Healthcheck

---

# 🔐 Sécurité

- Aucun secret stocké dans Git
- Variables d'environnement via `.env`
- Secrets GitHub Actions
- Images Docker signées et versionnées
- Healthcheck intégré au conteneur WordPress
- Alertes automatiques en cas d'incident

---

# 📁 Structure du projet

```
.
├── .github/
│   └── workflows/
├── docker/
├── k8s/
├── monitoring/
├── scripts/
├── Dockerfile
├── docker-compose.yml
└── README.md
```

---

#  Auteur

**Hajar Douhab**

Projet réalisé dans le cadre du **Titre Professionnel Administrateur Systèmes DevOps (ASD)**.
## CI/CD Test

README updated on 05/07/2026.