terraform {
  backend "gcs" {
    bucket = "meshcloud-tf-states"
    prefix = "meshcloud-prod/building-blocks/dns/service-account"
  }
}
