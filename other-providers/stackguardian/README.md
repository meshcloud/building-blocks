# StackGuardian Building Block

## How the Building Block works
The Building Block first downloads the latest version of `sg-cli` and uses that to run the commands. The Building Block will Create and Run the Stack using the information from the `payload.json`. If there is already a Stack with that name, the Building Block will execute that Stack instead. The `sg-cli` does not allow you to update a Stack after it is created.


## How to use this Building Block in meshStack

1. Copy the stack-guardian-building-block repository into your local working environment
2. Modify `payload.json` to fit your requirements. You can insert your StackGuardian Template Group and Integration names, then add in the Workflows that you would like to create. You can also pass variables into the  Workflow by updating the `iacInputData.data` values. You can then prompt users to input values for these variables before creating Building Blocks in meshStack. In the example `payload.json`, we have provided a Workflow example in the `payload.json` file that you can use as a guide
3. After modifying your local copy of the `stack-guardian-building-block` repository, save it to a Github repository
4. Go to your meshStack admin area and click on "Building Blocks" from the left pane
5. Click on "Create Building Block"
6.  Fill out the general information and click next
7.  Select your supported platform
8.  Select "Terraform" in Implementation Type and put in the Terraform version
9.  Copy the repository HTTPS address to the "Git Repository URL" field (if its a private repo, add your SSH key) click next
10.  For the input, you will need to provide values required by StackGuardian as well as any variables that need to be injected into `payload.json`. The Stack name will be a combination of `$customerId_$projectId_$buildingBlockUuid` and is applied during Stack Creation in `main.tf`. Those values can be changed as needed. You can create any variables that need to be passed into your `payload.json` but the following variables are required:

- **SG_API_TOKEN** - StackGuardian API Token (as environment variable)
- **SG_BASE_URL** - StackGuardian Base URL (as environment variable) (ex. https://api.app.stackguardian.io)
- **SG_DASHBOARD_URL** - StackGuardian Dashboard URL (as environment variable) (ex. https://app.stackguardian.io/orchestrator/orgs/$company-name)
- **sg_organization** - StackGuardian Organization Name
- **sg_workflow_group** - StackGuardian Workflow Group
- **building_block_uuid** - `Source` is Building Block UUID
- **customer_id** - `Source` is Customer Identifier
- **project_id** - `Source` is Project Identifier

12.  Now users can add this building block to their tenants

## Backend configuration
Here you can find an example of how to create a backend.tf file on this [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)