terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "0.3.0-beta1"
    }
  }
}

provider "btp" {
  globalaccount = "98d249c7trial-ga"
  # username: use BTP_USERNAME environment variable
  # password: use BTP_PASSWORD environment variable
  username = "P2007243784"
  password = "!KGT3Ce8nM4cP.Z" #"ju9n6MM?f6&85M$"
}