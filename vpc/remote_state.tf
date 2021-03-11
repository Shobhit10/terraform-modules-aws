data "terraform_remote_state" "vpc_state" {
  backend = "s3"

  config {
    bucket = "${var.remote_state_bucket_name}"
    key    = "vpc-global-resources/${var.vpc_name_tag}/terraform.tfstate"
    region = "${var.remote_state_bucket_region}"
  }
}
