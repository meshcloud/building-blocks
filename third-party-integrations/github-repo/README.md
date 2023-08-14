# github-repo-building-block

Module that creates a github.com repository. It can be used as a Building Block
inside of meshStack.

https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository

## How to use this Building Block in meshStack 

### Env vars needed for provider

https://registry.terraform.io/providers/integrations/github/latest/docs

## Backend configuration
Here you can find an example of how to create a backend.tf file
### Azure storage account:
```
terraform {
  backend "azurerm" {
    tenant_id            = "<Tenant ID>"
    subscription_id      = "<Subscription ID>"
    resource_group_name  = "<Name of the resource group holding the state file>"
    storage_account_name = "<Name of the Storage account holding the state file>"
    container_name       = "<Name of the Container holding the state file>"
    key                  = "<Prefix of the state file name>"
  }
}
```

### GCS Bucket
```
terraform {
  backend "gcs" {
    bucket  = "<Name of the bucket holding the state file>"
    credentials = Local path to Google Cloud Platform account credentials in JSON format
    prefix  = "<Prefix of the state file name>"
  }
}
```


