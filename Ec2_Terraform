provider "aws" {
  region = "ap-south-1" 
}

terraform {
  backend "s3" {
    bucket = "prasanthkumarr"  
    key    = "terraform.tfstate"  
    region = "ap-south-1" 
    encrypt = false
  }
}

resource "aws_instance" "EC2" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"
  
  tags = {
    Name = "PrashJenkinsinstance"
  }
}
