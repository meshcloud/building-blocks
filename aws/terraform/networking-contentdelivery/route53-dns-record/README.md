# Building Block For AWS Route53 DNS Records

*Module Setup*: configures IAM User and S3 bucket for the Building Block.

*AWS Route53 DNS Records*: the actual building block code to be sourced from meshStack.

# Building Block For AWS Route53 DNS Records

Building Block module ready for meshStack.
Needs to be run with a service account with the following permissions:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["route53:GetChange", "route53:ListHostedZones"],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "route53:ListTagsForResource",
        "route53:GetHostedZone",
        "route53:ChangeResourceRecordSets",
        "route53:ListResourceRecordSets"
      ],
      "Resource": [
        "arn:aws:route53:::hostedzone/<your-zone-1>",
        "arn:aws:route53:::hostedzone/<your-zone-2>",
        ...
      ]
    },
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::<your-state-bucket>"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::<your-state-bucket>/*"
    }
  ]
}
```

You can restrict the available zones selectable by Building Block consumers by
- making the `zone_name` input static (fixed zone),
- applying a regex validation like `^(my_zone_a\.com)|(my_zone_b\.com)$`.

## Backend configuration
Here you can find an example of how to create a backend.tf file

### AWS S3 Bucket
```
terraform {
  backend "s3" {
    bucket = "<bucket name>"
    key    = "<Prefix of the state file name>"
    region = "<Location name>"
  }
}
```
### Azure storage account:
```
terraform {
  backend "azurerm" {
    tenant_id            = "<Tenant ID>"
    subscription_id      = "<Subscription ID>"
    resource_group_name  = "<Name of the resource group holding the state file>"
    storage_account_name = "<Name of the Storage account holding the state file>"
    container_name       = "<Name of the Container holding the state file>"
    key                  = "<Prefix of the state file name>"
  }
}
```

### GCS Bucket
```
terraform {
  backend "gcs" {
    bucket  = "<Name of the bucket holding the state file>"
    credentials = Local path to Google Cloud Platform account credentials in JSON format
    prefix  = "<Prefix of the state file name>"
  }
}
```