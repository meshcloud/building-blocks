# Budget-Alert-building-block
This building block sets up a budget on your organization for your project scope. 

The following APIs need to be enabled:
- cloud billing API
- service usage API
- Cloud Billing Budget API

The service account requires the following permission on the organization level:
- Billing Account Administrator

on the Project level:
- roles/serviceusage.serviceUsageConsumer

## Notes:
- Create and upload your backend.tf in input section of the building block definition in meshStack
- add your service account JSON key containings as a string and encrypted environment variable and name it "GOOGLE_CREDENTIALS"
