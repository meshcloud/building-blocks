# github-repo-building-block

Module that creates a github.com repository. This repository can be based on a template repo.
It can be used as a Building Block inside of meshStack.

* If you want to have a github action enabled repository, It is mandatory that create this github repo based on a template repository which already has the "./github/workflows/" path.

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
    - add other Variables:
        - github_token and github_owner variable is the required credentials for the github provider
    - add rest of the variables in variables.tf as you desired
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants
### Env vars needed for provider

https://registry.terraform.io/providers/integrations/github/latest/docs

## Backend configuration
Here you can find an example of how to create a backend.tf file on this [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)