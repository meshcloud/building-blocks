resource "aws_iam_role" "deploy_budget" {
  name = "deploy-budget"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : [
            "arn:aws:iam::${var.backend_account_id}:user/${var.iam_user_to_assume_this_role}"
          ]
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
