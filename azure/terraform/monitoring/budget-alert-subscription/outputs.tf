output "Budget_notification" {
  value = azurerm_consumption_budget_subscription.subscription_budget.notification
}

output "start_date" {
  value = azurerm_consumption_budget_subscription.subscription_budget.time_period[0].start_date
}

output "end_date" {
  value = azurerm_consumption_budget_subscription.subscription_budget.time_period[0].end_date
}

output "budget_amount" {
  value = azurerm_consumption_budget_subscription.subscription_budget.amount
}

output "action_group_id" {
  value = azurerm_monitor_action_group.action_group.id
}

output "resource_group_id" {
  value = azurerm_resource_group.action_group_rg.id
}
