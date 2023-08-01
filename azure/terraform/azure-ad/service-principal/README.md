# Azure-Service-Principal-building-block
   This module creates an Azure AD Application with a service principal and generate a password for it.
   
   ***Having a Service Principal is a prerequisite for deployment of building blocks***
If it is the first time that you want to leverage building blocks, you have to run this module manually.
To do so please follow these steps:
1. Clone the repository and navigate to this folder in the terminal.
2. Adopt your backend in backend.tf
3. Run ```terraform init``` and then ```terraform apply```
4. Export the required information from terraform output with ```terraform output -json```

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