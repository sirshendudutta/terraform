###Count vs for_each ###
## for_each meta argument whose value is a map or set of strings, Terraform creates one instance for each member of that map or set
/*
variable "user_names" {
    type = set(string)
    default = ["alice","bob","john"]  
}

resource "aws_iam_user" "this" {
  for_each = var.user_names
  name = each.value
}
*/

variable "my-map" {
  default = {
    key = "value"
    key = "value1"
  }
}

resource "aws_instance" "web" {
  for_each      = var.my-map
  ami           = each.value
  instance_type = "t2.micro"

  tags = {
    name = each.value
  }

}