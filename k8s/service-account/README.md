# Building Block for a Self Hosted GCP NAT

This module creates a k8s service account in a configured cluster, and binds it to a defined ClusterRole.

## Usage

- Before using in meshStack, create a kubernetes service account that has necessary permissions to create service accounts and bind them with cluster roles.

- Generate a kubeconfig

- Upload the generated kubeconfig file to meshStack building block definition as encrypted static file input (e.g. input name: config)

- Upload a config.tf with provider and backend config (See [terraform backend config Wiki](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers))

  ```hcl
  provider "kubernetes" {
    config_path    = "./kubeconfig"
    config_context = "..." # Name of the kubeconfig context
  }

  <terraform backend config>
  ```

  to meshStack building block definition as encrypted static file input (e.g. input name: config.tf)
