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
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

resource "null_resource" "motto" {
  triggers = {
    always = timestamp()
  }
  provisioner "local-exec" {
    command = "echo gotta catch em all"
  }
}
