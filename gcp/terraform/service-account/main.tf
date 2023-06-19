
locals {
  all_project_services = concat(var.gcp_service_list, [
    "serviceusage.googleapis.com",
    "iam.googleapis.com",
  ])
}

resource "google_project_service" "enabled_apis" {
  project  = var.project_id
  for_each = toset(locals.all_project_services)
  service  = each.key

  disable_on_destroy = false
}


resource "google_service_account" "sa" {
  project      = var.project_id
  account_id   = var.account_id
  display_name = var.description

  depends_on = [
    google_project_service.enabled_apis,
  ]
}

resource "google_project_iam_member" "sa_iam" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.sa.email}"

  depends_on = [
    google_project_service.enabled_apis,
  ]
}

resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.sa.name
}

