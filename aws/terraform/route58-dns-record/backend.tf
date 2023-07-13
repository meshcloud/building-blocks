terraform {
  backend "s3" {
    bucket = "terraform-122242464811"
    key    = "dns-building-block"
    region = "eu-central-1"
  }
}
