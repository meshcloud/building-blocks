terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }

  backend "s3" {
    bucket  = "meshcloud-backend-terraform27092024"
    key     = "state/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}


provider "aws" {
  region = var.aws_region
}