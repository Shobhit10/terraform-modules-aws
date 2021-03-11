resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id       = aws_subnet.public.id
  depends_on      = [aws_internet_gateway.gw]	
  tags {
    Name = "${var.vpc_name_tag}-NAT"
  }
}

output "nat_gateway_ip" {
  value = aws_eip.nat_gateway.public_ip
}
