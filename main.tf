provider "aws" {
    region = "ap-south-1"  
}

resource "aws_instance" "aws" {
  ami           = "ami-05fa00d4c63e32376" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "prashjenkins"
  }
}
