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

##### 

##### **| Composante | Statut |**

##### **|---|---|**

##### **| Dépôt GitHub + pipeline CI/CD | ✅ Opérationnel |**

##### **| Docker WordPress + MySQL | ✅ Opérationnel |**

##### **| Image Docker Hub | ✅ Publiée automatiquement |**

##### **| Environnement de test | ✅ Configuré |**

##### **| Terraform + Ansible | ✅ En place |**

##### **| Kubernetes | 🔄 En cours (S8) |**

##### **| Prometheus + Grafana | 🔄 À venir (S11) |**

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

##### **- Application : WordPress latest**

##### **- Base de données : MySQL 8.0**

##### **- Serveur web : Nginx**

##### **- Conteneurs : Docker + Kubernetes**

##### **- IaC : Terraform + Ansible**

##### **- CI/CD : GitHub Actions**

##### **- Supervision : Prometheus + Grafana**

##### 

##### **## Image Docker**

##### 

##### **```bash**

##### **docker pull hajardh01/wordpress-asd:latest**

##### 

##### 

##### **Disponible sur : https://hub.docker.com/r/hajardh01/wordpress-asd**

##### 

##### **## Lancer le projet en local**

##### 

##### **```bash**

##### **# Copier les variables d'environnement**

##### **cp docker/.env.example docker/.env**

##### 

##### **# Lancer WordPress + MySQL**

##### **docker compose -f docker/docker-compose.yml up -d**

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