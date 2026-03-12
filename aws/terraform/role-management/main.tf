locals {
  # Define your role names and their corresponding ARNs here
  role_arns = {
    "finops"   = "arn:aws:sso:::permissionSet/ssoins-69873586782ebb40/ps-1042dedfea9727c7"
    "security" = "arn:aws:sso:::permissionSet/ssoins-69873586782ebb40/ps-69873258fbec01d2"
  }
}

# 3. Look up Identity Center Instance
data "aws_ssoadmin_instances" "this" {}

# 4. Look up the User ID by UserName
data "aws_identitystore_user" "this" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]

  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = var.user_name
    }
  }
}

# 5. The Assignment
resource "aws_ssoadmin_account_assignment" "this" {
  
  # The role will be assigned only after operator approves the request
  count = var.approval ? 1 : 0

  instance_arn = tolist(data.aws_ssoadmin_instances.this.arns)[0]

  # Select the ARN based on the input variable
  permission_set_arn = local.role_arns[var.selected_role]

  principal_id   = data.aws_identitystore_user.this.user_id
  principal_type = "USER"

  target_id   = var.target_aws_account_id
  target_type = "AWS_ACCOUNT"
}
