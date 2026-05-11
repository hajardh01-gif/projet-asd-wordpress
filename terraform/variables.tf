variable "fly_api_token" {
  description = "Token API Fly.io"
  type        = string
  sensitive   = true
}

variable "app_name" {
  description = "Nom app Fly.io"
  type        = string
  default     = "projet-asd-wordpress"
}

variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "petit-journal"
}

variable "db_name" {
  description = "Nom base de données"
  type        = string
  default     = "wordpress"
}

variable "db_user" {
  description = "Utilisateur MySQL"
  type        = string
  default     = "wordpress"
}

variable "db_password" {
  description = "Mot de passe MySQL"
  type        = string
  sensitive   = true
}

variable "db_root_password" {
  description = "Mot de passe root MySQL"
  type        = string
  sensitive   = true
}

variable "app_dir" {
  description = "Dossier application"
  type        = string
  default     = "/opt/petit-journal"
}