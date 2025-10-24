terraform {
  backend "s3" {
    bucket         = "mybucket"
    key            = "path/to/my/key"
    region         = "us-east-1"
    encrypt        = true
    profile        = "myprofile"
    role_arn       = "arn:aws:iam::215974853022:role/team-1qh28hgo0g1c-tf-assume-role"
    dynamodb_table = "team-1qh28hgo0g1c-state-lock"
  }
  required_version = ">= 0.15"
}

variable "region" {
  description = "AWS region"
  type = string
}

provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "instance" {
  ami = data.aws_ami.ubuntu
  instance_type = "t2.micro"
  tags = {
    Name = terraform.workspace
  }
}
