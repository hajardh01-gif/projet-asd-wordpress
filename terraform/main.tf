terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "wordpress" {
  name = "wordpress:latest"
}

resource "docker_image" "mysql" {
  name = "mysql:8.0"
}

resource "docker_network" "wordpress_network" {
  name = "wordpress_network"
}
