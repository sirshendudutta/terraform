provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "terraform_instance_new" {
  ami = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_ids]
  tags = {
    Name = "Terraform_Instance1"
  }
}