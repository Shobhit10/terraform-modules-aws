## Create and Associate Route Tables

resource "aws_route_table" "private" {
  count  = "${length(var.cidr_private)}"
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${element(var.private_name_tag, count.index)}"
  }
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.cidr_private)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private.*.id, count.index)}"
}

resource "aws_route_table" "public" {
  count  = "${length(var.cidr_public)}"
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${element(var.dmz_name_tag, count.index)}"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.cidr_public)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public.*.id, count.index)}"
}
