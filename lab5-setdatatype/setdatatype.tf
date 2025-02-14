
variable "my-list" {
  type = list
  default = ["raj","john","bob"]
}

output "my-list" {
  value = var.my-list[0]
}


/*
variable "my-set" {
  type = set(string)
  default = ["john","bob"]
}

output "set" {
  value = var.my-set
}
*/