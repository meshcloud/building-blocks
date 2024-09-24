resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = var.ec2_size
  user_data = <<EOF
#!/bin/bash
echo "Copying the SSH Key to the server"
SSHPUBKEY="${var.ec2_sshpub_key}"
echo -e $S{{SSHPUBKEY}} >> /home/ec2-user/.ssh/authorized_keys
EOF
}