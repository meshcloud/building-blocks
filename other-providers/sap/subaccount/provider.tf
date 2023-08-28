terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "0.3.0-beta1"
    }
  }
}

provider "btp" {
  globalaccount = "XXXXXX" # Should look like: "98d249c7trial-ga"
  # username: use BTP_USERNAME environment variable
  # password: use BTP_PASSWORD environment variable
}
