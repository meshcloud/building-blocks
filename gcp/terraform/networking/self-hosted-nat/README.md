# Building Block for a Self Hosted GCP NAT

This module sets up a custom, self hosted NAT. It creates a VM that functions as a NAT gateway with a fixed public IP, and a route to NAT for specified tags.

## Usage

- Before using in meshStack, create a bucket and a service account that has access to the bucket and has a compute admin and network admin roles in the GCP projects that will hold the NAT VM. A sample can be found in [prerequisites.tf](./examples/prerequisites.tf).

- Upload credentials.json of the created service account to meshStack building block definition as encrypted static file input (e.g. input name: credentials.json)

- Upload generated config.tf file to meshStack building block definition as encrypted static file input (e.g. input name: config.tf)
