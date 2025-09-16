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

module "flask_inst" {
  source = "./infra"
}