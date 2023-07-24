#Update with the project you are deploying module to
project_id = "example-project"

#Time that 
time_partitioning = "DAY"

#The labels for dataset being deployed
dataset_labels = {
  env      = "dev"
  billable = "true"
  owner    = "johndoe"
}

#List of the tables that you are 
tables = [
  {
    table_id = "test",
    schema   = "sample_bq_schema.json",
    labels = {
      env      = "dev"
      billable = "true"
      owner    = "joedoe"
    },
  },
]
