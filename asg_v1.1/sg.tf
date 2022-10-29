resource "aws_security_group" "main" {
  name        = "${var.env}-main-sg"
  description = "this is a security group for main instance"
  vpc_id      = "vpc-0e176f3417bb9549e"
}

resource "aws_security_group_rule" "main_ingress" {
  count = length(var.ingress_ports)
  type              = "ingress"
  from_port         = element(var.ingress_ports, count.index)
  to_port           = element(var.ingress_ports, count.index)
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "main_egress_httpd" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}
