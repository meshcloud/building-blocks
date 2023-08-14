terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = ["122242464811"]
}
