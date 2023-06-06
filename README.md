# Building Blocks - Unlocking Efficiency through Modularization
Information about how to use or extend these modules can be found in our [Wiki](https://github.com/meshcloud/Building-Blocks/wiki)

## What are Building Blocks exactly?
Building blocks is becomming the new universal primitive for assembling landing zones and cloud tenants in meshStack. Each building block represents an encapsulated piece of functionality provided to an application team. Explained in a single picture below, application teams can flexibly assemble building blocks on the landing zone’s “base-line” as required to support their use case.

<img width="1047" alt="image" src="https://github.com/meshcloud/Building-Blocks/assets/96071919/176ef530-ab73-4c4e-9f13-8ee681eb68c1">

## At a glance, Building blocks:
- have inputs and outputs, forming a building-block-graph tracking dependencies between blocks
- can directly attach to cloud tenants
- are mandatory and optional parts that form a landing zone 
- provide multiple implementation options:
  - meshStack will include out-of-the-box support for terraform modules
  - “manual” building blocks enable incremental automation starting from a GUI-based manual process
  - platform engineers can implement custom blocks using on an external block-runner API
- are aware of their desired and actual state in a tenant

## Advantages of Building Blocks
- Application teams have easy self-service access to best practice building blocks as part of transparent landing zones or via the marketplace 
- Enable you to serve compliant cloud infrastructure to application teams for a variety of use cases by mix and matching building blocks
- Continuously grow maturity of your Landing Zones
- Native terraform support - you deliver the configuration we take care of the rest!
- Providing a low effort alternative to Service Brokers with no yml files required
- No tenant bindings anymore!
<img width="1061" alt="image" src="https://github.com/meshcloud/Building-Blocks/assets/96071919/61c08b6e-4c07-4c8f-85d0-0791508a7951">

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
