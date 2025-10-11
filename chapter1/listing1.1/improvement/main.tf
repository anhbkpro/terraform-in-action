terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "helloworld" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "helloworld"
  }
}

output "instance_public_ip" {
  value = aws_instance.helloworld.public_ip
  description = "The public IP address of the HelloWorld instance"
}
