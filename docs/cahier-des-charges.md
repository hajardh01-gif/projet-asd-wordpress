CAHIER DES CHARGES - PROJET ASD WORDPRESS DEVOPS

Version: 1.0

Date: Mars 2026

Projet: Infrastructure DevOps automatisee pour blog WordPress

Technologie: WordPress, MySQL, Docker, Kubernetes, Terraform, Ansible, Prometheus, Grafana



TABLE DES MATIERES

1\. Presentation du Projet

2\. Architecture Technique

3\. Modules Fonctionnels

4\. Infrastructure DevOps

5\. Securite

6\. Supervision

7\. Contraintes et Prerequis



1\. PRESENTATION DU PROJET



1.1 Contexte

Le projet ASD WordPress DevOps est une infrastructure complete permettant

le deploiement automatise d un blog WordPress avec base de donnees MySQL,

pipeline CI/CD et supervision en temps reel via Prometheus et Grafana.



1.2 Objectifs

\- Automatiser la creation et configuration des serveurs via Terraform et Ansible

\- Deployer WordPress en continu via un pipeline CI/CD GitHub Actions

\- Gerer les conteneurs Docker et orchestrer via Kubernetes

\- Superviser l infrastructure en temps reel

\- Securiser l infrastructure (secrets, pare-feu, variables d environnement)



1.3 Perimetre

Utilisateurs concernes:

\- Administrateur systeme : gestion complete de l infrastructure

\- Developpeur : push du code declenche le deploiement automatique

\- Visiteur : acces au blog WordPress et inscription newsletter



2\. ARCHITECTURE TECHNIQUE



2.1 Stack Technique

Composant         Technologie

Application       WordPress latest

Base de donnees   MySQL 8.0

Serveur web       Nginx

Conteneurs        Docker + Docker Compose

Orchestration     Kubernetes (minikube)

IaC               Terraform + Ansible

CI/CD             GitHub Actions

Supervision       Prometheus + Grafana

OS serveur        Ubuntu 22.04



2.2 Structure du Projet

projet-asd-wordpress/

├── README.md

├── docs/

│   ├── cahier-des-charges.md

│   ├── architecture.md

│   └── schema.png

├── scripts/

│   ├── provision/

│   │   └── provision.sh

│   └── verify/

│       └── verify.sh

├── ansible/

│   └── playbook.yml

├── terraform/

│   └── main.tf

├── docker/

│   ├── docker-compose.yml

│   └── docker-compose.test.yml

└── .github/

&#x20;   └── workflows/

&#x20;       └── deploy.yml



3\. MODULES FONCTIONNELS



3.1 Blog WordPress

Fonctionnalites:

\- Publication d articles et gestion des medias

\- Gestion des categories et tags

\- Systeme de commentaires

\- Interface d administration WordPress

\- Theme responsive



3.2 Newsletter

Fonctionnalites:

\- Formulaire de collecte d emails des visiteurs

\- Stockage des emails dans MySQL

\- Gestion des abonnes



3.3 Base de donnees MySQL

Fonctionnalites:

\- Stockage des donnees WordPress

\- Volumes persistants pour ne pas perdre les donnees

\- Sauvegardes automatiques

\- Restauration des donnees testee



4\. INFRASTRUCTURE DEVOPS



4.1 BC01 - Automatiser le deploiement de l infrastructure



Terraform:

\- Creation automatique des ressources cloud

\- Gestion de l etat de l infrastructure

\- Variables et modules reutilisables



Ansible:

\- Configuration automatique des serveurs

\- Installation de Docker sur les serveurs

\- Deploiement reproductible et idempotent



Scripts:

\- Script Python de provisionnement des serveurs

\- Script Bash de verification post-deploiement

\- Automatisation des taches repetitives



Securisation:

\- Configuration du pare-feu

\- Gestion des secrets via variables d environnement

\- Aucun mot de passe dans le code Git



4.2 BC02 - Deployer en continu une application



Environnements:

Environnements:



\- Developpement : local via Docker Compose

&#x20; Role : developpement et tests unitaires en local par le developpeur

&#x20; Fichier : docker/docker-compose.yml

&#x20; Acces : http://localhost:8080



\- Test (pre-production) : environnement isole Docker

&#x20; Role : valider que l application fonctionne avant mise en production

&#x20; Fichier : docker/docker-compose.test.yml

&#x20; Acces : http://localhost:8081

&#x20; Declenchement : automatique via pipeline CI/CD a chaque push



\- Production : cloud public via Kubernetes

&#x20; Role : environnement final accessible aux utilisateurs

&#x20; Fichier : kubernetes/

&#x20; Acces : domaine public

&#x20; Declenchement : apres validation de l environnement de test

Docker:

\- Conteneurisation de WordPress et MySQL

\- Images publiees sur Docker Hub

\- Docker Compose pour orchestration multi-services



Kubernetes:

\- Deploiement sur cluster Kubernetes

\- Scaling horizontal automatique

\- Gestion des secrets Kubernetes



Pipeline CI/CD GitHub Actions:

\- Declenchement automatique a chaque git push

\- Etapes : build, test, push image, deploy

\- Strategies de deploiement : rolling update



4.3 BC03 - Superviser les services deployes



Prometheus:

\- Collecte des metriques CPU, RAM, reseau, uptime

\- Alertes configurees sur seuils critiques

\- Retention des donnees sur 15 jours



Grafana:

\- Dashboard temps reel de l infrastructure

\- Visualisation CPU, RAM, disponibilite

\- Alertes visuelles en cas d incident



Alertes configurees:

\- Site WordPress inaccessible

\- RAM superieure a 80%

\- CPU superieure a 90%

\- Base de donnees inaccessible



5\. SECURITE



5.1 Gestion des secrets

\- Aucun secret commit dans Git

\- Fichier .env exclu via .gitignore

\- Variables d environnement pour tous les mots de passe

\- Fichier .env.example fourni comme modele



5.2 Infrastructure

\- Pare-feu configure sur le serveur

\- Acces SSH securise par cle

\- Mots de passe forts pour MySQL

\- HTTPS configure (certificat SSL)



5.3 Conformite Git

.gitignore contient :

\- .env

\- \*.tfvars

\- .terraform/

\- \*.tfstate



6\. SUPERVISION



6.1 Indicateurs surveilles (KPIs)

\- Disponibilite du site (uptime)

\- Temps de reponse HTTP

\- Utilisation CPU du serveur

\- Utilisation RAM du serveur

\- Espace disque disponible

\- Nombre de connexions base de donnees



6.2 Procedure en cas d incident

1\. Detection de l alerte via Grafana

2\. Identification de la cause (logs)

3\. Correction du probleme

4\. Redemarrage du service si necessaire

5\. Redaction d un post-mortem en anglais



7\. CONTRAINTES ET PREREQUIS



7.1 Contraintes Techniques

\- Docker Desktop installe sur le poste de travail

\- Minikube pour Kubernetes en local

\- Git et GitHub pour le versioning

\- WSL2 sur Windows pour Ansible



7.2 Contraintes de Securite

\- Aucun secret dans Git (eliminatoire pour le jury)

\- Variables d environnement obligatoires

\- Pare-feu active sur le serveur



7.3 Prerequis Deploiement

\- Compte GitHub avec token d acces

\- Docker Hub pour les images

\- Cloud provider pour la production



7.4 Configuration requise (.env)

DB\_PASSWORD=motdepasse\_fort

DB\_ROOT\_PASSWORD=root\_motdepasse\_fort

8\. STRATEGIE DE STOCKAGE DES DONNEES



8.1 Base de donnees

\- Type : MySQL 8.0 (relationnelle)

\- Justification : WordPress necessite une base relationnelle pour

&#x20; stocker les articles, utilisateurs et configurations

\- Stockage : volume Docker nomme db\_data

\- Taille estimee : 10 Go pour 1 an de production



8.2 Fichiers WordPress

\- Type : volume Docker nomme wordpress\_data

\- Contenu : themes, plugins, medias uploades

\- Taille estimee : 5 Go



8.3 Sauvegardes

\- Frequence : quotidienne a 2h du matin

\- Outil : mysqldump via script backup.sh

\- Retention : 7 jours glissants

\- Emplacement : dossier /backups sur le serveur

\- Test de restauration : procedure documentee ci-dessous



8.4 Procedure de restauration

1\. Arreter WordPress : docker compose stop wordpress

2\. Restaurer la BDD : docker exec db mysql -u wordpress -p wordpress < backup.sql

3\. Redemarrer : docker compose start wordpress

4\. Verifier que le site fonctionne sur http://localhost:8080



8.5 Droits d acces

\- app\_user : lecture et ecriture sur la base wordpress

\- Acces reseau limite au reseau Docker interne

\- Mot de passe via variable d environnement uniquement



8.6 Type de stockage utilise

\- Stockage bloc : volume Docker pour MySQL (acces rapide I/O)

\- Stockage fichier : volume Docker pour les medias WordPress



Fin du Cahier des Charges

