# Building Block for Kubernetes Service Account

This module creates a k8s service account in a configured cluster, and binds it to a defined ClusterRole.

## Usage

- Before using in meshStack, create a kubernetes service account that has necessary permissions to create service accounts and bind them with cluster roles, create a secret from which token shall be used as static input in meshStack.

- Upload a backend.tf (See [terraform backend config Wiki](https://github.com/meshcloud/building-blocks/wiki/%5BUser-Guide%5D-Setting-up-the-Backend-for-terraform-state#how-to-configure-backendtf-file-for-these-providers))
  to meshStack building block definition as a new encrypted static file input (e.g. input name: backend.tf).
