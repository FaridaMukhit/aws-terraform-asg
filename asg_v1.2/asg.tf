resource "aws_autoscaling_group" "main" {
  name                      = replace(local.name, "rtype", "asg")
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = var.desired_size
  force_delete              = true
  launch_configuration      = aws_launch_configuration.main.name
  vpc_zone_identifier       = var.vpc_zone_identifier

  tag {
    key   = "name"
    value = replace(local.name, "rtype", "asg")
    propagate_at_launch = true
  }
  dynamic "tag" {
    for_each = local.common_tags
    content {
      key   = tag.key
      value = tag.value
      propagate_at_launch = true
    }
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50

    }
  }

  lifecycle {
    create_before_destroy = true
  }
}