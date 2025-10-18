provider "aws" {
  region = "us-west-2"
}

module "s3backend" {
  source = "terraform-in-action/s3backend/aws"
  namespace = "tia"
}

output "s3backend_config" {
  value = module.s3backend.config
}
