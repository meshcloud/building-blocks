# AWS Role Management via meshStack Building Block
This building block empowers users to request supplementary AWS access through a streamlined, self-service workflow.

How it Works
User Input: The requester selects a functional role (e.g., FinOps or Security), provides their unique User ID, and specifies the Target AWS Account ID.

Automated Provisioning: The building block maps the chosen role to its corresponding Permission Set ARN and executes the assignment in the background.

Least Privilege: The automation requires only a single, scoped IAM role within the Management Account to perform the cross-account assignment via IAM Identity Center.

Role Mapping
To simplify the user experience, technical Permission Set ARNs are abstracted behind human-readable labels. When a user selects a role from the dropdown menu, the building block automatically resolves the underlying ARN required for the AWS API call.

# Setup

The following IAM policy must be provisioned in the AWS Management Account. It grants the necessary permissions to assign specific Permission Sets exclusively to users within a designated target AWS account. Ensure all placeholders are replaced with your specific values before proceeding.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "IdentityStoreReadOnly",
            "Effect": "Allow",
            "Action": [
                "identitystore:ListUsers",
                "identitystore:DescribeUser",
                "identitystore:GetUserId"
            ],
            "Resource": [
                "arn:aws:identitystore::<AWS_ROOT_ACCOUNT>:identitystore/<IDENTITY_STORE>",
                "arn:aws:identitystore:::user/*"
            ]
        },
        {
            "Sid": "SSODiscoveryAndMetadata",
            "Effect": "Allow",
            "Action": [
                "sso:ListInstances",
                "sso:DescribePermissionSet",
                "sso:ListAccountAssignments",
                "sso:DescribeAccountAssignmentCreationStatus",
                "sso:DescribeAccountAssignmentDeletionStatus"
            ],
            "Resource": "*"
        },
        {
            "Sid": "RestrictedAccountAssignment",
            "Effect": "Allow",
            "Action": [
                "sso:CreateAccountAssignment",
                "sso:DeleteAccountAssignment"
            ],
            "Resource": [
                "arn:aws:sso:::instance/ssoins-<SSO_INSTANCE_ID>",
                "arn:aws:sso:::permissionSet/ssoins-<SSO_INSTANCE_ID>/<PERMISSION_SET1>",
                "arn:aws:sso:::permissionSet/ssoins-<SSO_INSTANCE_ID>/<PERMISSION_SET2>",
                "arn:aws:sso:::account/*"
            ],
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "<AWS_REGION>"
                }
            }
        }
    ]
}
```

Create an IAM user in the AWS Management Account and generate CLI Access Keys. Once created, attach the IAM policy defined in the previous step to this user. Configure the building block's AWS authentication by providing the IAM Access Keys.

