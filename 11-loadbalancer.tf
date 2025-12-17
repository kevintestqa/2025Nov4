resource "aws_lb" "app_tier_alb" {
  //name               = "noob-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_ec2.id]
  subnets            = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]

  enable_deletion_protection = false

  tags = {
    "Environment" = "satelite"
  }
}
