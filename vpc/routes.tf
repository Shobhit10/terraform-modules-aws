resource "aws_route" "public_internet" {
  count                  = "${length(var.cidr_public)}"
  route_table_id         = "${element(aws_route_table.public.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_route" "private_internet" {
  count                  = "${length(var.cidr_private)}"
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = "${element(aws_network_interface.nat_gateway.*.id, count.index)}"
}

