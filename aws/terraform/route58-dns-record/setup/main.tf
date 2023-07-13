resource "aws_iam_user" "user" {
  name = "dns-building-block"
}

resource "aws_iam_policy" "dns_building_block" {
  name   = "dns_building_block"
  policy = file("${path.module}/policy.json")
}

resource "aws_iam_user_policy_attachment" "attach-user" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.dns_building_block.arn
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.user.name
}

resource "aws_s3_bucket" "terraform_backend" {
  bucket = "terraform-122242464811"
}
