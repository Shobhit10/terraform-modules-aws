variable "ami_type" {
  description = "The AMI type to select linux, windows"
  default = "amazon-linux-2"
}

variable "ami_ref" {
  description = "Can be the keyword 'lab' or 'prod'"
  default = "promoted"
}

variable "aws_account_ids" {
  description = "Accounts capable of owning the AMI"
  type = "list"
  default = ["814285299440"]
}
