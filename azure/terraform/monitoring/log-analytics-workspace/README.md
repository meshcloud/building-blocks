# log-analytics-building-block


## How to use this Building Block in meshStack 

1. Go to your meshStack admin area and click on "Building Blocks" from the left pane
2. Click on "Create Building Block"
3. Fill out the general information and click next
4. Select "Azure" as your supported platform 
5. Select "Terraform" in Implementation Type and put in the Terraform version
6. Copy the repository HTTPS address to the "Git Repository URL" field (if its a private repo, add your SSH key) click next
7. For the input do the following
    - Add the service principal's "ARM_CLIENT_SECRET" and "ARM_CLIENT_ID" as Environmental Variable
    - add the add the "subscription_id" as "Platform Tenant ID"
    - add the rest of the variables as platform operator or user input
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants
