

data "aws_vpc" "main" {
  id =  var.vpc_id
}

 resource "aws_security_group" "SG_mytfserver" {
  name        = "SG_mytfserver"
  description = "My server SG"
  vpc_id      = data.aws_vpc.main.id

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my_ip_with_cidr]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}
data "template_file" "user_data"{
   template = file("./userdata.yaml")
}

/*
data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["myami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

*/

resource "aws_instance" "ubuntu" {
  ami           = "ami-00842a994f5018db8"
  instance_type = var.instance_type
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = [aws_security_group.SG_mytfserver.id]
  user_data = data.template_file.user_data.rendered

  tags = {
    Name = var.server_name
  }
}

