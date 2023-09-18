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
Here you can find an example of how to create a backend.tf file on this [Wiki Page](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers)