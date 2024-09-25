resource "aws_vpc" "vpc" {
  provider   = aws
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}