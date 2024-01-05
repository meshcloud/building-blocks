terraform {
  backend "local" {
  }
  # backend "s3" {
  #   bucket = "<bucket name>"
  #   key    = "datadog-child-org"
  #   region = "<Location name>"
  # }
}