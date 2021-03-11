## Create ENI's for DNS

resource "aws_network_interface" "dns" {
  count           = "${length(var.cidr_public)}"
  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
  private_ips     = ["${cidrhost(element(aws_subnet.public.*.cidr_block, count.index), 10)}"]
  security_groups = ["${aws_security_group.dns.id}"]

  tags {
    Name = "dns-${element(var.az_suffix, count.index)}"
  }
}
