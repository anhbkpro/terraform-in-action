variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type = string
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for EC2 instances"
  default = null
  type = string
}

variable "region" {
  description = "The region to deploy resources into"
  default = "us-west-2"
  type = string
}
