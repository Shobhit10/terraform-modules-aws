## Main Variables
variable "aws_region" {
  description = "The AWS region where all resources will be created"
}

variable "vpc_cidr" {
  description = "The main CIDR block for the VPC"
}

variable "lab_ingress_cidr_ranges" {
  type    = "list"
  default = ["10.0.0.0/8"]
}

## Subnet CIDR block ranges
variable "cidr_private" {
  description = "CIDR block for Private subnets"
  type        = "list"
}


variable "cidr_public" {
  description = "CIDR block for public subnets"
  type        = "list"
}


variable "az_suffix" {
  description = "Names for Private Subnet & Route Tables"
  type        = "list"
  default     = ["a", "b", "c"]
}

## DHCP Option Sets
variable "dhcp_domain_name" {
  description = "The DHCP domain name"
}

variable "dhcp_ntp_servers" {
  description = "IP's for the DNS servers"
  type        = "list"
}

## Bastion Security group CIDR ranges
variable "allowed_rdp_ingress_ranges" {
  type = "list"
}

variable "allowed_ssh_ingress_ranges" {
  type = "list"
}

# Variables related to other referenced components.
# These variables would be used when referencing the remote state of the other components.

variable "remote_state_bucket_name" {
  description = "The name of the S3 bucket containing the remote state"
}

variable "remote_state_bucket_region" {
  description = "The region of the S3 bucket containing the remote state"
}
