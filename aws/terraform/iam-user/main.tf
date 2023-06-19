resource "aws_iam_user" "user" {
  name = var.name
}

resource "aws_iam_user_policy_attachment" "attach-user" {
  user       = aws_iam_user.user.name
  policy_arn = var.policy_arns
}
