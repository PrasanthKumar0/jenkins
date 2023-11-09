provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  
  instance_tenancy = "default"
  tags = {
    Name = "jenkins"
  }
}

resource "aws_security_group" "jenkins-sg-2022" {
  name        = var.security_group
  description = "security group for EC2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group
  }
}

resource "aws_instance" "myFirstInstance" {
  ami                    = var.ami_id
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins-sg-2022.id]
  subnet_id              = aws_subnet.my_subnet.id  
  tags = {
    Name = var.tag_name
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true  
}
