
//-----------------------------------------------
// Budget on subscription level
//-----------------------------------------------
data "azurerm_subscription" "subscription" {
  subscription_id = var.ARM_SUBSCRIPTION_ID
}

resource "azurerm_consumption_budget_subscription" "subscription_budget" {
  name            = var.budget_name
  subscription_id = data.azurerm_subscription.subscription.id

  amount     = 1000
  time_grain = "Monthly"

  time_period {
    start_date = var.start_date #"2022-06-01T00:00:00Z"
    end_date   = var.end_date   #"2022-07-01T00:00:00Z"
  }

  # filter {
  #   dimension {
  #     name = "ResourceGroupName"
  #     values = [
  #       azurerm_resource_group.example.name,
  #     ]
  #   }

  #   tag {
  #     name = "foo"
  #     values = [
  #       "bar",
  #       "baz",
  #     ]
  #   }
  # }

  notification {
    enabled   = true
    threshold = 90.0
    operator  = "EqualTo"

    contact_emails = var.contact_emails

  }

  notification {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = var.contact_emails

    contact_groups = [
      azurerm_monitor_action_group.action_group.id,
    ]

  }

}
//-----------------------------------------------
// Action Group
//-----------------------------------------------
resource "azurerm_resource_group" "rg_action_group" {
  name     = var.resource_group_for_action_group_name
  location = var.location
}
resource "azurerm_monitor_action_group" "action_group" {
  name                = "budget_action_group"
  resource_group_name = azurerm_resource_group.rg_action_group.name
  short_name          = "bdgt_ag"
}
