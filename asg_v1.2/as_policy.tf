resource "aws_autoscaling_policy" "main" {
  name                   = replace(local.name, "rtype", "as-policy")
  scaling_adjustment     = 2
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.main.name
}
