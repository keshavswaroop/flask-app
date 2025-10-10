terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "flask_instance" {
  source = "./infra"

  key_name = "flask-key"
  default_vpc_name = "flask-vpc"
  instance_name = "flask_instance"
  security_group_name = "flask_security_g"
}

module "ansible_master" {
  source = "./infra"

  key_name = "ansible-key"
  default_vpc_name = "ansible-vpc"
  instance_name = "ansible_master_instance"
  security_group_name = "ansible_sg"
}