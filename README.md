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

<img width="1060" alt="image" src="https://github.com/meshcloud/Building-Blocks/assets/96071919/547fae73-4e05-4712-8e0f-3d62f44f7c55">
