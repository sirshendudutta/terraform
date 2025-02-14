provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "terraform-ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  count                  = 2
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_ids]

  tags = {
    Name = "Terraform_Instance1"
  }

}

resource "aws_s3_bucket" "my_mexico_bucket011" {
  bucket = "my-mexico-bucket"
#   acl    = "private"

  tags = {
    Name = "MyMexicoBucket"
  }
}

resource "aws_iam_user" "raj" {
  name = "raj"
}

