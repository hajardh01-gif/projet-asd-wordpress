terraform {
  required_version = ">= 1.7.0"

  required_providers {
    fly = {
      source  = "fly-apps/fly"
      version = "~> 0.0.23"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "fly" {
  fly_api_token = var.fly_api_token
}

# IP publique IPv4
resource "fly_ip" "prod_ipv4" {
  app  = var.app_name
  type = "v4"
}

# IP publique IPv6
resource "fly_ip" "prod_ipv6" {
  app  = var.app_name
  type = "v6"
}

# Machine Fly.io WordPress
resource "fly_machine" "wordpress" {
  app    = var.app_name
  region = "cdg"
  name   = "${var.project_name}-wordpress"

  image = "wordpress:6.8-apache"

  env = {
    WORDPRESS_DB_HOST     = "localhost:3306"
    WORDPRESS_DB_NAME     = var.db_name
    WORDPRESS_DB_USER     = var.db_user
    WORDPRESS_DB_PASSWORD = var.db_password
  }

  services = [
    {
      protocol      = "tcp"
      internal_port = 80

      ports = [
        {
          port     = 80
          handlers = ["http"]
        },
        {
          port     = 443
          handlers = ["tls", "http"]
        }
      ]
    }
  ]
}

# Génération inventaire Ansible
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"

  content = <<-EOT
[prod]
${fly_ip.prod_ipv4.address} ansible_user=root

[prod:vars]
ansible_python_interpreter=/usr/bin/python3
app_dir=${var.app_dir}
project_name=${var.project_name}
wordpress_url=https://${var.app_name}.fly.dev
EOT
}
