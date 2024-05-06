terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      #version = "3.35.0"
    }
  }
}

# APP and API keys are inherited from the environment
provider "datadog" {
}