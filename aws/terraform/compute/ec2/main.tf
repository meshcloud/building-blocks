#locals {
#  sshpub_key = var.ec2_sshpub_key
#}

resource "aws_instance" "ec2_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = var.ec2_size
  subnet_id     = var.ec2_subnet_id
  # root disk
  root_block_device {
    volume_size           = tostring(var.ec2_storage_size)
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }
}