# Configure the AWS Provider
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
}

resource "aws_instance" "tfserver" {
  ami   = var.ami_id
  count = 1
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = ["newsg"]
  tags = {
    Name = var.tag_name
  }
}

resource "aws_security_group" "newsg" {
  ingress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags =  {
    Name = var.security_group
  }
}

