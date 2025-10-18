# Outputs for networking module

output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    lb = module.lb_sg.security_group.id
    db = module.db_sg.security_group.id
    websrv = module.websrv_sg.security_group.id
  }
}
