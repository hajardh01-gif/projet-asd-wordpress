output "project_name" {
  description = "Nom du projet deploye"
  value       = var.project_name
}

output "vm_name" {
  description = "Nom de la VM provisionnee"
  value       = var.vm_name
}

output "app_directory" {
  description = "Dossier de l application sur le serveur"
  value       = var.app_dir
}

output "ansible_inventory_path" {
  description = "Chemin de l inventaire Ansible genere"
  value       = local_file.ansible_inventory.filename
}

output "next_step" {
  description = "Prochaine commande a executer"
  value       = "ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml"
}