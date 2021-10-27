terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "felipe-instance" {
  ami                         = "ami-0c2b8ca1dad447f8a"
  availability_zone           = "us-east-1c"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  key_name                    = "bdg-virginia"
  vpc_security_group_ids = [ "sg-0f43175ac794117b2" ]
 
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = "40"
    volume_type           = "gp3"
  }
 
  tags = {
    "Owner"               = "Felipe"
    "Name"                = "Felipe-instance"
  }
}
