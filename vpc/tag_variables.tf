## VPC Specific Tags:

variable "vpc_name_tag" {
  description = "The name of the VPC"
}

variable "private_name_tag" {
  description = "Names for Private Subnet & Route Tables"
  type        = "list"
  default     = ["Private-A", "Private-B", "Private-C"]
}

variable "tools_name_tag" {
  description = "Names for DMZ Subnet & Route Tables"
  type        = "list"
  default     = ["public-A", "public-B", "public-C"]
}
