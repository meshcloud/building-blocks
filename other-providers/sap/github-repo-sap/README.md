# github-repo-building-block

Module that creates a GitHub repository for the purpose of deploying to SAP-BTP environment. This repository can be based on a GitHub template repository.

* If you want to have a github action enabled repository, It is mandatory to create this github repo based on a template repository which already has the "./github/workflows/" path.
There is a conditional expression to include the "template" block only when the "use_template" variable is true


https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository

## How to use this Building Block in meshStack 

1. Go to your meshStack admin area and click on "Building Blocks" from the left pane
2. Click on "Create Building Block"
3. Fill out the general information and click next
4. Select any of the platforms as your supported platform to attach this building block to.
5. Select "Terraform" in Implementation Type and put in the Terraform version
6. Copy the repository HTTPS address to the "Git Repository URL" field (if its a private repo, add your SSH key) click next
7. For the inputs do the following
    - Backend configuration:
        - Select "File" as input type and upload the backend.tf file.
        - Add related environment variables based on your backend configuration (e.g. client_id and client_secret for azure, SA_ID and SA_EMAIL for GCS)
    - Provider's Variables:
        - Add github_owner variable 
        - Add GITHUB_TOKEN Environment variable
    - Add rest of the variables from variables.tf as you desired
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants
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


