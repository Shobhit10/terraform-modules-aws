resource "aws_subnet" "private" {
  count             = "${length(var.cidr_private)}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${element(var.cidr_private, count.index)}"
  availability_zone = "${format("%s%s", var.aws_region, element(var.az_suffix, count.index))}"

  tags {
    Name = "${element(var.private_name_tag, count.index)}"
  }
}

resource "aws_subnet" "public" {
  count             = "${length(var.cidr_public)}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${element(var.cidr_public, count.index)}"
  availability_zone = "${format("%s%s", var.aws_region, element(var.az_suffix, count.index))}"

  tags {
    Name = "${element(var.public_name_tag, count.index)}"
  }
}
