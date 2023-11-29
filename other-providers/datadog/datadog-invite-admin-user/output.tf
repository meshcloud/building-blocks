output "user_id" {
  description = "User Resource ID"
  value       = datadog_user.new_user.id
}

output "invitation_id" {
  description = "User Invitation ID"
  value       = datadog_user.new_user.user_invitation_id
}
