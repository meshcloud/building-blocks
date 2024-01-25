
# Collect current users assinged to the project and their permissions
locals {
  stdusers  = { for user in var.users : user.username => user if contains(user["roles"], "admin") || contains(user["roles"], "user")  }
  #users = { for user in var.users : user.username => user if contains(user["roles"], "user") }
  readers = { for user in var.users : user.username => user if contains(user["roles"], "reader") }
}

data "datadog_role" "stduser" {
  filter = "Datadog Standard Role"
}

data "datadog_role" "rouser" {
  filter = "Datadog Read Only Role"
}

# Create a new Datadog - Amazon Web Services integration
# Enable datadog plugins for AWS
resource "datadog_integration_aws" "onboarding" {
  account_id = var.tenant_id
  role_name  = var.datadog_role_name
  host_tags  = ["workspaceid:${var.workspace_id}", "projectid:${var.project_id}", "tenantid:${var.tenant_id}"]
  account_specific_namespace_rules = {
    auto_scaling = false
    opsworks     = false
  }
}

// Project admins and users are mapped to Datadog Standard roles
resource "datadog_user" "stdusers" {
  for_each = local.stdusers
  email    = each.key
  name     = join(" ", [each.value["firstName"],each.value["lastName"]])
  roles = [data.datadog_role.stduser.id]
  send_user_invitation = false
}

// Project admins are mapped to Datadog Standard roles
resource "datadog_user" "readers" {
  for_each = local.readers
  email    = each.key
  name     = join(" ", [each.value["firstName"],each.value["lastName"]])
  roles = [data.datadog_role.rouser.id]
  send_user_invitation = false
}

# AWS part
# Create new IAM role, policy and trust relationship
# to allow datadog aws account var.datadog_aws_account to
# use that role and pull data

data "aws_iam_policy_document" "datadog_aws_integration_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.datadog_aws_account}:root"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        "${datadog_integration_aws.onboarding.external_id}"
      ]
    }
  }
}

# https://docs.datadoghq.com/integrations/amazon_web_services/
data "aws_iam_policy_document" "datadog_aws_integration" {
  statement {
    actions = ["apigateway:GET",
      "autoscaling:Describe*",
      "backup:List*",
      "budgets:ViewBudget",
      "cloudfront:GetDistributionConfig",
      "cloudfront:ListDistributions",
      "cloudtrail:DescribeTrails",
      "cloudtrail:GetTrailStatus",
      "cloudtrail:LookupEvents",
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "codedeploy:List*",
      "codedeploy:BatchGet*",
      "directconnect:Describe*",
      "dynamodb:List*",
      "dynamodb:Describe*",
      "ec2:Describe*",
      "ec2:GetTransitGatewayPrefixListReferences",
      "ec2:SearchTransitGatewayRoutes",
      "ecs:Describe*",
      "ecs:List*",
      "elasticache:Describe*",
      "elasticache:List*",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeTags",
      "elasticfilesystem:DescribeAccessPoints",
      "elasticloadbalancing:Describe*",
      "elasticmapreduce:List*",
      "elasticmapreduce:Describe*",
      "es:ListTags",
      "es:ListDomainNames",
      "es:DescribeElasticsearchDomains",
      "events:CreateEventBus",
      "fsx:DescribeFileSystems",
      "fsx:ListTagsForResource",
      "health:DescribeEvents",
      "health:DescribeEventDetails",
      "health:DescribeAffectedEntities",
      "kinesis:List*",
      "kinesis:Describe*",
      "lambda:GetPolicy",
      "lambda:List*",
      "logs:DeleteSubscriptionFilter",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
      "logs:DescribeSubscriptionFilters",
      "logs:FilterLogEvents",
      "logs:PutSubscriptionFilter",
      "logs:TestMetricFilter",
      "organizations:Describe*",
      "organizations:List*",
      "rds:Describe*",
      "rds:List*",
      "redshift:DescribeClusters",
      "redshift:DescribeLoggingStatus",
      "route53:List*",
      "s3:GetBucketLogging",
      "s3:GetBucketLocation",
      "s3:GetBucketNotification",
      "s3:GetBucketTagging",
      "s3:ListAllMyBuckets",
      "s3:PutBucketNotification",
      "ses:Get*",
      "sns:List*",
      "sns:Publish",
      "sqs:ListQueues",
      "states:ListStateMachines",
      "states:DescribeStateMachine",
      "support:DescribeTrustedAdvisor*",
      "support:RefreshTrustedAdvisorCheck",
      "tag:GetResources",
      "tag:GetTagKeys",
      "tag:GetTagValues",
      "xray:BatchGetTraces",
      "xray:GetTraceSummaries"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "datadog_aws_integration" {
  name   = "DatadogAWSIntegrationPolicy"
  policy = data.aws_iam_policy_document.datadog_aws_integration.json
}

resource "aws_iam_role" "datadog_aws_integration" {
  name               = var.datadog_role_name
  description        = "Role for Datadog AWS Integration"
  assume_role_policy = data.aws_iam_policy_document.datadog_aws_integration_assume_role.json
}

resource "aws_iam_role_policy_attachment" "datadog_aws_integration" {
  role       = aws_iam_role.datadog_aws_integration.name
  policy_arn = aws_iam_policy.datadog_aws_integration.arn
}