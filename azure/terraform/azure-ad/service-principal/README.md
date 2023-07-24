# Azure-Service-Principal-building-block
   This module creates an Azure AD Application with a service principal and generate a password for it.
   
   ***Having a Service Principal is a prerequisite for deployment of building blocks***
If it is the first time that you want to leverage building blocks, you have to run this module manually.
To do so please follow these steps:
1. Clone the repository and navigate to this folder in the terminal.
2. Adopt your backend in backend.tf
3. Run ```terraform init``` and then ```terraform apply```
4. Export the required information from terraform output with ```terraform output -json```

