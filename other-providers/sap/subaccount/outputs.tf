output "btp_subaccount_id" {
  value = btp_subaccount.my_project.id
}

output "btp_subaccount_region" {
  value = btp_subaccount.my_project.region
}

output "btp_subaccount_name" {
  value = btp_subaccount.my_project.name
}

output "btp_subaccount_parent_id" {
  value = btp_subaccount.my_project.parent_id
}

output "btp_subaccount_environment_instance_name" {
  value = btp_subaccount_environment_instance.cloudfoundry.name
}
output "btp_subaccount_environment_instance_broker_id" {
  value = btp_subaccount_environment_instance.cloudfoundry.broker_id
}

output "btp_subaccount_environment_instance_dashboard_url" {
  value = btp_subaccount_environment_instance.cloudfoundry.dashboard_url
}

output "btp_subaccount_environment_instance_id" {
  value = btp_subaccount_environment_instance.cloudfoundry.id
}

output "btp_subaccount_environment_instance_platform_id" {
  value = btp_subaccount_environment_instance.cloudfoundry.platform_id
}

output "btp_subaccount_environment_instance_service_id" {
  value = btp_subaccount_environment_instance.cloudfoundry.service_id
}

output "btp_subaccount_environment_instance_state" {
  value = btp_subaccount_environment_instance.cloudfoundry.state
}
