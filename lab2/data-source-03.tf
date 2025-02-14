
provider "aws" {
  region = "us-east-1"
}

data "aws_instances" "foo" {
    filter {
      name = "tag:Name"
      values = "Terraform_Instance1 "
    }
}