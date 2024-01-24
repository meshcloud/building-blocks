# Budget Alert
This building block will set up a budget alert for your account. You can easily define an amount, threshold, and the alert receiver emails to keep an eye on your cost.

## Requirements
- You need a user with at least "AWSBudgetsActionsWithAWSResourceControlAccess" permission.
- "Access Key ID" and "Secret Access Key" for the authentication of the terraform provider and backend bucket
- Terraform backend file (see the next section)

**Note**: Please either generate your provider information and use it as an input, or uncomment provider configuration section in terraform.tf file

## Backend configuration
Here you can find an example of how to create a backend.tf file on this [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)