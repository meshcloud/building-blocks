# Azure-Bastion-Service
    This module deployes and Azure Bastion Service in your Virtual network. You can then connect to other VMs in the same vnet from portal via this service.

## pre-requirements
- You should already have a virtual network deployed
- You should have a resource group 

**note**: If you have deployed your virtual network with a vnet building block, you can leverage the dependency between building blocks and import the "vnet_name" and "resource_group_name" variables from that building block as inputs to the bastion host building block.

## How to use this Building Block in meshStack 

1. Go to your meshStack admin area and click on "Building Blocks" from the left pane
2. Click on "Create Building Block"
3. Fill out the general information and click next
4. Select "Azure" as your supported platform 
5. Select "Terraform" in Implementation Type and put in the Terraform version
6. Copy the repository HTTPS address to the "Git Repository URL" field (if its a private repo, add your SSH key) click next
7. For the input do the following
    - add the service principal's "ARM_CLIENT_SECRET" and "ARM_CLIENT_ID" as Environmental Variable
    - add the add the "subscription_id" as "Platform Tenant ID"
    - add the rest of the variables as platform operator or user input
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants

## Backend configuration
Here you can find an example of how to create a backend.tf file on this [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)