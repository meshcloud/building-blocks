resource "aws_vpc" "vpc" {
    provider = aws
    cidr_block = var.cidr_block
}