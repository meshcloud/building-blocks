locals {
  start_date              = formatdate("YYYY-MM-01'T'hh:mm:ssZ", timestamp())
  end_date                = formatdate("2026-MM-01'T'hh:mm:ssZ", local.start_date)
  action_group_name       = "budget-alert-action-group"
  action_group_short_name = "bdgt-ap"
}
//-----------------------------------------------
// Budget on subscription level
//-----------------------------------------------
data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_id
}

resource "azurerm_consumption_budget_subscription" "subscription_budget" {
  name            = var.budget_name
  subscription_id = data.azurerm_subscription.subscription.id

  amount     = var.monthly_budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = local.start_date #"2022-06-01T00:00:00Z"
    end_date   = local.end_date   #"2022-07-01T00:00:00Z"
  }

  notification {
    enabled   = true
    threshold = var.actual_threshold
    operator  = "EqualTo"

    contact_emails = var.contact_emails
    contact_groups = [azurerm_monitor_action_group.action_group.id]
  }

  notification {
    enabled        = true
    threshold      = var.forcasted_threshold
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = var.contact_emails
    contact_groups = [azurerm_monitor_action_group.action_group.id]
  }

}

//-----------------------------------------------
// Action Group
//-----------------------------------------------

resource "azurerm_resource_group" "action_group_rg" {
  name     = var.resource_group_for_action_group
  location = var.location
}
resource "azurerm_monitor_action_group" "action_group" {
  name                = local.action_group_name
  resource_group_name = azurerm_resource_group.action_group_rg.name
  short_name          = local.action_group_short_name
}
