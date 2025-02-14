provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_ec2" {
  ami           = "ami-085ad6ae776d8f09c"
  instance_type = "t2.micro"
  lifecycle {
    prevent_destroy = true 
    # create_before_destroy = false
  }
  tags = {
    Name = "hello world"
  }
}