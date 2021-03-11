resource "aws_flow_log" "flow_log" {
  log_group_name = "${aws_cloudwatch_log_group.flow_log_group.name}"
  iam_role_arn   = "${data.terraform_remote_state.vpc_state.role_flow_log_arn}"
  vpc_id         = "${aws_vpc.main.id}"
  traffic_type   = "ALL"
}

resource "aws_cloudwatch_log_group" "flow_log_group" {
  name = "/aws/flowlog"
}
