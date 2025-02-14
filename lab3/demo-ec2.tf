provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu-pro-server/images/hvm-ssd/ubuntu-xenial-16.04-amd64-pro-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.image.image_id
  instance_type = "t2.micro"
}