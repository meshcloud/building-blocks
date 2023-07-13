terraform {
  provider "azuredevops" {
    version = ">= 0.0.1"
    # Remember to specify the org service url and personal access token details below
    org_service_url       = "xxxxxxxxxxxxxxxxxxxx"
    personal_access_token = "xxxxxxxxxxxxxxxxxxxx"
  }
}
