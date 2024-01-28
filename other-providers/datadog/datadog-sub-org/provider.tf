terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      version = "3.35.0"
    }
  }
}

# Configure the Datadog provider
provider "datadog" {
  api_url = var.datadog_url
}
