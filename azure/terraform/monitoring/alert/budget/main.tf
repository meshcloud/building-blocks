//-----------------------------------------------
// Budget on Management group level
//-----------------------------------------------

data "azurerm_management_group" "mgmt" {
  name = var.scope_management_group_id
}

resource "azurerm_consumption_budget_management_group" "mgmt_budget" {
  count               = var.budget_scope_level == "mgmt" ? 1 : 0
  name                = var.budget_name
  management_group_id = data.azurerm_management_group.mgmt.id

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

    contact_emails = [
      "foo@example.com",
      "bar@example.com",
    ]

  }

  notification {
    enabled        = false
    threshold      = 100.0
    operator       = "GreaterThan"
    threshold_type = "Forecasted"

    contact_emails = var.contact_emails
  }
}
//====================================================



//-----------------------------------------------
// Budget on subscription level
//-----------------------------------------------
data "azurerm_subscription" "subscription" {
  subscription_id = var.scope_subscription_id
}

resource "azurerm_consumption_budget_subscription" "subscription_budget" {
  count           = var.budget_scope_level == "sub" ? 1 : 0
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
      azurerm_monitor_action_group.action_group[0].id,
    ]

  }

}
//====================================================


//-----------------------------------------------
// Budget on Resource-group level
//-----------------------------------------------

data "azurerm_resource_group" "resource_group" {
  name = var.scope_rg_name
}

resource "azurerm_consumption_budget_resource_group" "resource_group_budget" {
  count             = var.budget_scope_level == "rg" ? 1 : 0
  name              = var.budget_name
  resource_group_id = data.azurerm_resource_group.resource_group.id

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
      azurerm_monitor_action_group.action_group[0].id,
    ]

  }

}


//====================================================


//-----------------------------------------------
// Action Group
//-----------------------------------------------
data "azurerm_resource_group" "rg_action_group" {
  name = var.resource_group_for_action_group_name
}
resource "azurerm_monitor_action_group" "action_group" {
  count               = var.budget_scope_level == "rg" ? 1 : var.budget_scope_level == "sub" ? 1 : 0
  name                = "budget_action_group"
  resource_group_name = data.azurerm_resource_group.rg_action_group.name
  short_name          = "bdgt_ag"
}
