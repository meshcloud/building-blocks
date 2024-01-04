terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = var.datadog_url
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
#  access_key = var.aws_access_key
#  secret_key = var.aws_secret_key
}