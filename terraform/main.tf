terraform {
  required_version = ">= 1.7.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# ─── VARIABLES ───────────────────────────────────────────
locals {
  project_name = var.project_name
  vm_name      = var.vm_name
  app_dir      = var.app_dir
}

# ─── RESSOURCE : VM simulée (null_resource) ──────────────
# Représente la VM de production (local ou cloud futur)
resource "null_resource" "vm_prod" {
  triggers = {
    vm_name    = var.vm_name
    project    = var.project_name
    app_dir    = var.app_dir
  }

  # Provisionnement : installe Docker + K3s via le script
  provisioner "local-exec" {
    command = <<-EOT
      echo "============================================"
      echo "Provisionnement VM : ${var.vm_name}"
      echo "Projet             : ${var.project_name}"
      echo "Dossier app        : ${var.app_dir}"
      echo "============================================"
    EOT
  }
}

# ─── RESSOURCE : Génère l'inventaire Ansible ─────────────
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = <<-EOT
    [prod]
    localhost ansible_connection=local

    [prod:vars]
    ansible_user=root
    ansible_python_interpreter=/usr/bin/python3
    app_dir=${var.app_dir}
    project_name=${var.project_name}
  EOT

  depends_on = [null_resource.vm_prod]
}

# ─── RESSOURCE : Génère le fichier .env de prod ──────────
resource "local_file" "env_prod" {
  filename = "${path.module}/../.env.prod"
  content  = <<-EOT
    # Généré par Terraform - NE PAS COMMITER
    PROJECT_NAME=${var.project_name}
    DB_NAME=${var.db_name}
    DB_USER=${var.db_user}
    DB_PASSWORD=${var.db_password}
    DB_ROOT_PASSWORD=${var.db_root_password}
    GRAFANA_USER=${var.grafana_user}
    GRAFANA_PASSWORD=${var.grafana_password}
  EOT

  depends_on = [null_resource.vm_prod]
}