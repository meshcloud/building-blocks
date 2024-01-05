output "budget_amount" {
  value = google_billing_budget.budget.amount
}

output "budget_id" {
  value = google_billing_budget.budget.id
}

output "budget_threshold" {
  value = google_billing_budget.budget.threshold_rules
}

output "budget_filter" {
  value = google_billing_budget.budget.budget_filter
}
