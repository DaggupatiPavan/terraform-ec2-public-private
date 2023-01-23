resource "aws_instance" "web-app" {
  tags = {
    Name = "Aws_linux"
  }
  ami                         = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = <<EOF
  #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1.12 -y 
    sudo service nginx start
    sudo systemctl enable nginx 
    echo "<h1>pavan-server-1</h1>" >> /usr/share/nginx/html/index.html
    EOF
  subnet_id                   = aws_subnet.PublicSubnet-1.id
  key_name                    = "sai-key"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
}

resource "aws_instance" "priv-app" {
  tags = {
    Name = "Aws_Private_Instance"
  }
  ami                         = "ami-0b5eea76982371e91"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = <<EOF
  #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1.12 -y 
    sudo service nginx start
    sudo systemctl enable nginx 
    echo "<h1>Private-Instance-1</h1>" >> /usr/share/nginx/html/index.html
    EOF
  subnet_id                   = aws_subnet.PrivateSubnet-1.id
  key_name                    = "sai-key"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
}