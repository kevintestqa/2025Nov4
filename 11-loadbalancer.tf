resource "aws_lb" "barret-lb" {
  //name               = "noob-tier-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.barret-sg.id]
  subnets            = [aws_subnet.public-us-west-1a.id, aws_subnet.public-us-west-1c.id]

  enable_deletion_protection = false

  tags = {
    "Environment" = "production"
  }
}
