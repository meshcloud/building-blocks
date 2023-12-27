output "budget_ARN" {
  value = aws_budgets_budget.monthly.arn
}

output "budget_amount" {
  value = aws_budgets_budget.monthly.limit_amount
}

output "budget_unit" {
  value = aws_budgets_budget.monthly.limit_unit
}

output "budget_notification" {
  value = aws_budgets_budget.monthly.notification
}
