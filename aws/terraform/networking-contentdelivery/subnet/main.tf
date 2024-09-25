resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  availability_zone       = "${var.aws_region}${var.aws_az}"
  map_public_ip_on_launch = var.public_ip
  tags = {
    Name = var.subnet_name
  }
}