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
  api_url = var.datadog_url
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
}