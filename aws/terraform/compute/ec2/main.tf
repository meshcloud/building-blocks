#locals {
#  sshpub_key = var.ec2_sshpub_key
#}

# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2_server" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.ec2_size
  subnet_id     = var.ec2_subnet_id
  # root disk
  root_block_device {
    volume_size           = tostring(var.ec2_storage_size)
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }
  tags = {
    Name = var.ec2_name
  }
}