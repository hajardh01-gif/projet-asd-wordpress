\# Schéma d'Architecture — WordPress DevOps



\## Les 3 environnements



| Environnement | Rôle | Accès | Fichier |

|---|---|---|---|

| Développement | Tests locaux du développeur | localhost:8080 | docker-compose.yml |

| Test / Pré-prod | Validation automatique CI/CD | localhost:8081 | docker-compose.test.yml |

| Production | Accessible aux utilisateurs | domaine public | Kubernetes + Terraform |



\## Pipeline CI/CD



Chaque `git push` sur `main` déclenche :

1\. `validate` — vérification des fichiers docker-compose

2\. `smoke-test` — lancement env test + curl WordPress + ping MySQL

3\. `publish` — build et push image sur Docker Hub



\## Supervision (BC03 — à venir)

\- Prometheus : collecte métriques CPU, RAM, uptime

\- Grafana : dashboards temps réel + alertes

