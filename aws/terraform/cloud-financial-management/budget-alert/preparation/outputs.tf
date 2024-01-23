output "role_arn" {
  value = aws_iam_role.deploy_budget.arn
}

output "role_assume_policy" {
  value = aws_iam_role.deploy_budget.assume_role_policy
}
