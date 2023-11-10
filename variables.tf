variable "aws_region" {
    description = "The AWS region to create things in."
    default     = "ap-south-1"
}

variable "key_name" {
    description = "SSH keys to connect to EC2 instance"
    default     = "564832"
}

variable "instance_type" {
    description = "Instance type for EC2"
    default     = "t2.micro"
}

variable "security_group" {
    description = "Name of security group"
    default     = "jenkins-sgroup"
}

variable "tag_name" {
    description = "Tag Name of EC2 instance"
    default     = "prashjenkins"
}

variable "ami_id" {
    description = "AMI for Ubuntu EC2 instance"
    default     = "ami-0ee23bfc74a881de5"
}

variable "versioning" {
    type        = bool
    description = "(Optional) A state of versioning."
    default     = false
}

variable "acl" {
    type        = string
    description = "Defaults to private"
    default     = "private"
}