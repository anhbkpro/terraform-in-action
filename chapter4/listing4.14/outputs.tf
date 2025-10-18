# Outputs from root
output "db_config" {
  value = module.database.db_config.password
}

output "lb_dns_name" {
  value = "tbd"
}
