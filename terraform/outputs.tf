output "fly_app_name" {
  value = var.app_name
}

output "fly_hostname" {
  value = "${var.app_name}.fly.dev"
}

output "fly_public_ip" {
  value = fly_ip.prod_ipv4.address
}