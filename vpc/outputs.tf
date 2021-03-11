## Various outputs

# VPC
output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.main.cidr_block}"
}

# Subnets
output "subnet_public_id" {
  value = ["${aws_subnet.public.*.id}"]
}

output "subnet_public_cidr" {
  value = ["${aws_subnet.public.*.cidr_block}"]
}

output "subnet_tools_availability_zones" {
  value = ["${aws_subnet.tools.*.availability_zone}"]
}

output "subnet_private_id" {
  value = ["${aws_subnet.private.*.id}"]
}

output "subnet_private_cidr" {
  value = ["${aws_subnet.private.*.cidr_block}"]
}

output "subnet_private_availability_zones" {
  value = ["${aws_subnet.private.*.availability_zone}"]
}

# ENI's
output "eni_dns" {
  value = ["${aws_network_interface.dns.*.id}"]
}


# Security Groups
output "sg_infra_bastion_allow_ssh" {
  value = "${aws_security_group.infra_bastion_allow_ssh.id}"
}

output "sg_infra_bastion_allow_rdp" {
  value = "${aws_security_group.infra_bastion_allow_rdp.id}"
}

output "sg_dns" {
  value = "${aws_security_group.dns.id}"
}

# Variables
output "var_allowed_rdp_ingress_ranges" {
  value = ["${var.allowed_rdp_ingress_ranges}"]
}

output "var_allowed_ssh_ingress_ranges" {
  value = ["${var.allowed_ssh_ingress_ranges}"]
}
