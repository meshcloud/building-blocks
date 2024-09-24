locals {
    sshpub_key = var.ec2_sshpub_key
}

resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = var.ec2_size
  # root disk
  root_block_device {
    volume_size           = tostring(var.ec2_storage_size)
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }
  user_data = <<EOF
#!/bin/bash
echo "Copying the SSH Key to the server"
SSHPUBKEY="${local.sshpub_key}"
echo -e $S{{SSHPUBKEY}} >> /home/ec2-user/.ssh/authorized_keys
EOF
}