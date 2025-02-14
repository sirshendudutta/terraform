#  module "ec2-instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "5.7.1"
# } 

module "ec2" {
  source = "git::https://github.com/zealvora/sample-kplabs-terraform-ec2-module"
}