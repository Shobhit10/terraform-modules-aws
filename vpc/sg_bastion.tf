## Security Groups for Bastion instances (SSH & RDP)

# Linux Bastion security group
resource "aws_security_group" "infra_bastion_allow_ssh" {
  name        = "infra_bastion_allow_ssh"
  description = "Allow access to Bastion servers on port 22 from on prem, and vpn endpoints"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_ssh_ingress_ranges}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name                 = "infra_bastion_allow_ssh"
    Application          = "bastion"
  }
}

# Windows Bastion security group
resource "aws_security_group" "infra_bastion_allow_rdp" {
  name        = "infra_bastion_allow_rdp"
  description = "Allow access to Bastion servers on port 3389 from on prem, and vpn endpoints"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_ssh_ingress_ranges}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name                 = "infra_bastion_allow_rdp"
    Application          = "bastion"
  }
}
