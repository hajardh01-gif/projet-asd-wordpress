##### **# Projet ASD — WordPress DevOps**

##### 

##### **Déploiement automatisé d'un blog WordPress avec base de données MySQL,**

##### **pipeline CI/CD et supervision complète via Prometheus et Grafana.**

##### 

##### **## Vision du Projet**

##### 

##### **Mettre en place une infrastructure DevOps complète pour déployer**

##### **automatiquement un blog WordPress, avec haute disponibilité et**

##### **supervision en temps réel.**

##### 

##### **## Statut du Projet**

## Statut du Projet
| Composante | Statut |
|---|---|
| Docker WordPress 6.8-apache + MySQL 8.0 | ✅ Opérationnel |
| Pipeline CI/CD GitHub Actions | ✅ Opérationnel |
| Image Docker Hub hajardh01/wordpress-asd | ✅ Publiée |
| Environnement de test isolé | ✅ Opérationnel |
| Terraform Fly.io + Ansible | ✅ En place |
| Kubernetes K3s manifests | ✅ Prêts |
| Prometheus + Grafana + Alertes | ✅ Opérationnel |
| Scripts backup/restore MySQL | ✅ Opérationnel |
| Sécurité secrets | ✅ Configurée |

##### 

##### **## Fonctionnalités**

##### 

##### **- Blog WordPress : publication d'articles, gestion des médias**

##### **- Base de données : MySQL 8.0 avec volumes persistants**

##### **- Newsletter : collecte d'emails des visiteurs**

##### **- Supervision : monitoring en temps réel CPU, RAM, disponibilité**

##### 

##### **## Stack Technique**

##### 

- Application : WordPress 6.8-apache (version pinnée)
- Base de données : MySQL 8.0
- Conteneurs : Docker + Kubernetes K3s
- IaC : Terraform Fly.io + Ansible
- CI/CD : GitHub Actions
- Supervision : Prometheus + Grafana + Alertes

##### 

##### **## Image Docker**

##### 

```bash
docker pull hajardh01/wordpress-asd:latest
```
https://hub.docker.com/r/hajardh01/wordpress-asd

##### 

##### **## Lancer le projet en local**

##### 

```bash
cp docker/.env.example docker/.env
docker compose -f docker/docker-compose.yml up -d
```

- WordPress : http://localhost:8080
- Grafana : http://localhost:3000
- Prometheus : http://localhost:9090


##### 

##### **# Accéder à WordPress**

##### **http://localhost:8080**

##### 

##### **# Interface admin**

##### **http://localhost:8080/wp-admin**

##### **```**

##### 

##### **## Ecosystème DevOps**

##### 

##### **- \*\*BC01 - Infrastructure\*\* : Déploiement automatisé via Terraform + Ansible**

##### **- \*\*BC02 - CI/CD\*\* : Pipeline GitHub Actions — validate → build → push Docker Hub**

##### **- \*\*BC03 - Supervision\*\* : Monitoring via Prometheus et Grafana (à venir)**

##### 

##### **## Pipeline CI/CD**

##### 

##### **Chaque push sur `main` déclenche automatiquement :**

##### 

##### **1.  Validation docker-compose (prod + test)**

##### **2.  Build image Docker**

##### **3.  Push automatique sur Docker Hub**

##### 

##### **## Sécurité**

##### 

##### **- Aucun secret dans Git**

##### **- Variables d'environnement via fichier .env (ignoré par .gitignore)**

##### **- Secrets GitHub Actions pour Docker Hub et base de données**

##### **- Pare-feu configuré sur le serveur**
## 📊 Monitoring (Prometheus + Grafana)

Le monitoring Kubernetes est déployé avec Helm et kube-prometheus-stack.

### Accès Grafana

URL :
http://localhost:3000

Utilisateur :
admin

Mot de passe :

kubectl get secret -n monitoring monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode

---

### Accès Prometheus

URL :
http://localhost:9090

Commande pour accéder :

kubectl port-forward -n monitoring svc/monitoring-kube-prometheus-prometheus 9090:9090

Prometheus permet de visualiser les métriques Kubernetes et vérifier les targets actives.

---

### Vérification pods monitoring

kubectl get pods -n monitoring

---

## 🌐 Accès WordPress

URL :
http://localhost:30080

WordPress est déployé sur Kubernetes avec MySQL.

---

## ☸ Kubernetes

Commandes utiles :

kubectl get pods  
kubectl get svc  
kubectl get pods -n monitoring  

---

## 🚀 CI/CD

Pipeline GitHub configuré avec :

.gitlab-ci.yml

Pipeline :

✔ build  
✔ test  
✔ deployment