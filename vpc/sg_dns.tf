esource "aws_security_group" "dns" {
  name        = "dns"
  description = "Security group for DNS servers"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["${var.cidr_ecp_shared_services}"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["${split(",", var.environment_tag == "ab" ? join(",", var.allowed_ssh_ingress_ranges) : "127.0.0.1/32")}"]
    security_groups = ["${aws_security_group.infra_bastion_allow_ssh.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name                 = "dns"
    Application          = "dns"
   }
}
