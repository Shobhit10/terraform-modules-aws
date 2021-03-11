locals {
  ami_filter_tag = "${( (var.ami_ref == "lab" || var.ami_ref == "prod") ? var.ami_ref : "*" )}"
  ami_filter_name = "${( (var.ami_ref == "lab" || var.ami_ref == "prod") ? "*" : var.ami_ref )}"
}


resource "null_resource" "ami_selection_properties" {
  # Empty resource to simply summarize the AMI filter and selected AMI name/image ID.
  triggers = {
    ami_filter_name = "${local.ami_filter_name}"
    ami_filter_tag = "${local.ami_filter_tag}"
    ami_architecture = "${data.aws_ami.instance_ami.architecture}"
    ami_image_id = "${data.aws_ami.instance_ami.image_id}"
    ami_name = "${data.aws_ami.instance_ami.name}"
    ami_location = "${data.aws_ami.instance_ami.image_location}"
    ami_creation_date = "${data.aws_ami.instance_ami.creation_date}"
    ami_tags = "${jsonencode(data.aws_ami.instance_ami.tags)}"
    ami_owner_id = "${data.aws_ami.instance_ami.owner_id}"
  }
}

data "aws_ami" "instance_ami" {
  most_recent      = true

  filter {
    name   = "name"
    values = ["${local.ami_filter_name}"]
  }
  filter {
    name   = "tag-key"
    values = ["${local.ami_filter_tag}"]
  }

  # select only AMIs owned by the EGP AWS accounts
  owners    = "${var.aws_account_ids}"
}

output "ami_name" {
  value = "${data.aws_ami.instance_ami.name}"
}

output "ami_id" {
  value = "${data.aws_ami.instance_ami.image_id}"
}
