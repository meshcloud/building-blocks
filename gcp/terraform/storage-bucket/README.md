# GCP storage bucket
    This building block Creates a new bucket in Google cloud storage service (GCS)

## How to use this Building Block in meshStack 

1. Go to your meshStack admin area and click on "Building Blocks" from the left pane
2. Click on "Create Building Block"
3. Fill out the general information and click next
4. Select "GCP" as your supported platform 
5. Select "Terraform" in Implementation Type and put in the Terraform version
6. Copy the repository HTTPS address to the "Git Repository URL" field (if its a private repo, add your SSH key) click next
7. For the inputs do the following
    - add variables based on your backend configuration (e.g. client_id and client_secret for azure, SA_ID and SA_EMAIL for GCS)
    - add other Variables:
        - project_id=your-project-id as regular variable
        - key.json as static file input (name of the input variable should be the same as service account credential file in provider block)
    - add the other variables in variables.tf as you desired
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants
