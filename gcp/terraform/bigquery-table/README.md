# GCP Bigquery table
    This building block creates a bigquery table in GCP

## How to use this Building Block in meshStack 

1. Go to your meshStack admin area and click on "Building Blocks" from the left pane
2. Click on "Create Building Block"
3. Fill out the general information and click next
4. Select "GCP" as your supported platform 
5. Select "Terraform" in Implementation Type and put in the Terraform version
6. Copy the repository HTTPS address to the "Git Repository URL" field (if its a private repo, add your SSH key) click next
7. For the inputs do the following
    - add Environmental Variable:
        - SA_ID=bq-deployer
        - PROJECT_ID=your-project-id
        - SA_EMAIL=$SA_ID@$PROJECT_ID.iam.gserviceaccount.com
    - add the add the other variables in variables.tf as you desired
8. On the next page, add the outputs from outputs.tf file and click on Create Building Block
9. Now users can add this building block to their tenants

### Notes:
1. You have to enable bigquery either via GCP Console or with using the following command:
    gcloud services enable bigquery-json.googleapis.com \ 
    --project $PROJECT_ID


2. Assign required permission to the SA:
    gcloud iam service-accounts create $SA_ID \
    --display-name $SA_ID \
    --project $PROJECT_ID

    gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$SA_EMAIL \
    --role roles/bigquery.dataOwner \
    --user-output-enabled false

    gcloud iam service-accounts keys create $HOME/.ssh/bq-key.json \
    --iam-account $SA_EMAIL \ 
    --project $PROJECT_ID

    ## Bigquery Pricing
    The cost of using bigquery is divided within two sections:
    1. Compute pricing
    2. Storage pricing
    To understand how cost will be calculated in GCP, refer to this [Link]("https://cloud.google.com/bigquery/pricing").