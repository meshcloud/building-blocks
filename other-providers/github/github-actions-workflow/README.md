# github-actions-workflow-building-block

This building block adds a workflow in your github actions.

* The github repository should already have the ".github/workflows" path inside


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
        - GITHUB_TOKEN Environment variable is the required credentials for the github provider
    - add rest of the variables in variables.tf as you desired
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants

## Dependency
This building block can be dependant on [github-repo]("https://github.com/meshcloud/building-blocks/tree/main/third-party-integrations/github-repo")
To do so:
1. in the building block definition, in the **dependency** tab, select "github-repo" building block.
2. in the inputs under **repository_name** input, select **Building Block Output** as Source and then choose "github repo: repo_name". 
3. click save
## Backend configuration
Here you can find an example of how to create a backend.tf file on this [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)
