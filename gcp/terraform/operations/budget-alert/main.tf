data "google_billing_account" "account" {
  billing_account = var.billing_account
}

resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id

  budget_filter {
    projects = ["projects/${var.projectid}"]
  }

  display_name = "Example Billing Budget"
  amount {
    specified_amount {
      currency_code = "EUR"
      units         = "100"
    }
  }
  threshold_rules {
    threshold_percent = 0.5
  }
}
