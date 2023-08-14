resource "google_bigquery_dataset" "default" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.dataset_friendly_name
  description                 = "This is a test description"
  location                    = var.dataset_location
  default_table_expiration_ms = 3600000

  labels = var.dataset_labels
}

resource "google_bigquery_table" "default" {
  dataset_id          = google_bigquery_dataset.default.dataset_id
  table_id            = var.table_id
  deletion_protection = false
  time_partitioning {
    type = "DAY"
  }

  labels = var.table_labels

  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF

}
