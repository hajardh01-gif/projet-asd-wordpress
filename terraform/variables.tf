variable "project_name" {
  description = "Nom du projet"
  type        = string
  default     = "petit-journal"
}

variable "vm_name" {
  description = "Nom de la VM de production"
  type        = string
  default     = "prod-petit-journal"
}

variable "app_dir" {
  description = "Dossier de l application sur le serveur"
  type        = string
  default     = "/opt/petit-journal"
}

variable "db_name" {
  description = "Nom de la base de données WordPress"
  type        = string
  default     = "wordpress"
}

variable "db_user" {
  description = "Utilisateur MySQL WordPress"
  type        = string
  default     = "wordpress"
}

variable "db_password" {
  description = "Mot de passe MySQL WordPress"
  type        = string
  sensitive   = true
}

variable "db_root_password" {
  description = "Mot de passe root MySQL"
  type        = string
  sensitive   = true
}

variable "grafana_user" {
  description = "Utilisateur Grafana"
  type        = string
  default     = "admin"
}

variable "grafana_password" {
  description = "Mot de passe Grafana"
  type        = string
  sensitive   = true
  default     = "admin"
}