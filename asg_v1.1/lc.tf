resource "aws_launch_configuration" "main" {
  name            = "${var.env}-main-lc"
  image_id        = "ami-06640050dc3f556bb"
  instance_type   = var.instance_type
  user_data       = data.template_file.userdata.rendered
  security_groups = [aws_security_group.main.id]
  key_name        = aws_key_pair.terrafrom-server-key.key_name

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_key_pair" "terrafrom-server-key" {
  key_name   = "terraform-server-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# lauch configuration is Immutable (NON-CHANGEABLE)
// 1. naming standard = aws-nonprod-dev-ue1-wordpress-resourcename
// 2. taggingn standarad