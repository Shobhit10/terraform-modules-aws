## Main Assignments
aws_region      = "us-west-2"
vpc_cidr        = "10.30.0.0/19"
cidr_private    = ["10.30.0.0/21", "10.30.8.0/21"]
cidr_public        = ["10.30.20.0/23", "10.30.22.0/23"]

## Tag Assignments
vpc_name_tag            = "Lab"

## DHCP Option Set / DNS vars
dhcp_domain_name         = "us-west-2.compute.internal mydomain.com"
dhcp_ntp_servers         = ["10.20.8.25", "10.20.16.25"]

# Security group vars
allowed_rdp_ingress_ranges   =["10.0.0.0/8"]
allowed_ssh_ingress_ranges   =["10.0.0.0/8"]
