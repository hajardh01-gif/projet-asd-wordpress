# Ansible — Provisionnement Le Petit Journal d'Orléans

## Rôles

| Rôle | Description |
|------|-------------|
| common | Mise à jour système, paquets de base, timezone |
| security | UFW firewall, SSH hardening |
| k3s | Installation K3s (Kubernetes léger) |
| app | Déploiement des manifests Kubernetes |

## Utilisation

```bash
ansible-playbook -i inventory.ini playbook.yml
```

## Prérequis

- Ubuntu 22.04
- Python 3.x
- Ansible 2.14+