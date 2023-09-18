[![GitHub license](https://img.shields.io/github/license/meshcloud/building-blocks.svg)](https://github.com/meshcloud/building-blocks/blob/main/LICENSE)
[![GitHub contributors](https://img.shields.io/github/contributors/meshcloud/building-blocks.svg)](https://github.com/meshcloud/building-blocks/graphs/contributors)
[![GitHub issues](https://img.shields.io/github/issues/meshcloud/building-blocks.svg)](https://github.com/meshcloud/building-blocks/issues)
[![GitHub pull-requests](https://img.shields.io/github/issues-pr/meshcloud/building-blocks.svg)](https://github.com/meshcloud/building-blocks/pulls/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

[![GitHub watchers](https://img.shields.io/github/watchers/meshcloud/building-blocks.svg?style=social&label=Watch&maxAge=2592000)](https://GitHub.com/meshcloud/building-blocks/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/meshcloud/building-blocks.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/meshcloud/building-blocks/network/)
[![GitHub stars](https://img.shields.io/github/stars/meshcloud/building-blocks.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/meshcloud/building-blocks/stargazers/)

[![Open in Visual Studio Code](https://img.shields.io/static/v1?logo=visualstudiocode&label=&message=Open%20in%20Visual%20Studio%20Code&labelColor=2c2c32&color=007acc&logoColor=007acc)](https://open.vscode.dev/meshcloud/building-blocks)

# Building Blocks - Unlocking Efficiency through Modularization
Information about what is Building Blocks and how to use or extend these modules can be found in our [Wiki](https://github.com/meshcloud/Building-Blocks/wiki)
![image](https://github.com/meshcloud/building-blocks/assets/96071919/fcc374fe-8f52-4503-812d-e2434b898794 | width=300)

## Terraform versions
This module has been tested using Terraform 1.4.5 and various versions to up the latest at time of release. We advise upgrading to the latest version of terraform.

## Usage
In your meshStack "Admin area", under the "Building Blocks" section, create a new building block for the desired module. Insert the path of that module and all the inputs and outputs necessary including the service principal and your tenant information. Then wait for the terraform runner to apply you configuration and generate necessary outputs.
For more detailed steps, please refer to the module's readme file.

### Service Principal
1. Before deploying any module to the cloud environment, it is imperative to have an Azure service principal (or an IAM user in AWS, or a Service account in GCP) with appropriate permissions at the desired scope. It is possible to utilize an existing service principal for this purpose, or you can refer to the provided links below to set up a new service principal within the targeted environment:

- [Azure Service principal module](https://github.com/meshcloud/Building-Blocks/wiki/Azure-service-principal-module)
- AWS IAM User module
- GCP Service account module
 
## Permissions
Based on the recource you are going to deploy, you have to assign required role to the service principal. For Instance, in Azure you can assign the contributor role in the "meshcloud's management group" scope. However, it is recommended to have the "policy of least privilege" in mind. 

## Requirements
To apply one of these building block modules in your cloud environment via meshStack you need:
- Admin access to the meshStack to be able to add a new building block
- Have a configured meshPlatform in your meshStack with an active project inside
- A service principal in your cloud environment which have the required permissions to apply your module

## Required Inputs
Please refer to the readme provided in the modules for a list of the required inputs.

## License
[Apache License 2.0](https://github.com/meshcloud/Building-Blocks/blob/main/LICENSE)

## Contributing
[Contributing](https://github.com/meshcloud/Building-Blocks/wiki/Contributing)
