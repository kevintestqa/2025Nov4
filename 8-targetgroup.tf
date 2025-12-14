resource "aws_lb_target_group" "web_alb_tg" {
    name = "web-tier-server-target-group"
    port = 80
    vpc_id = aws_vpc.satelite_environment.id
    protocol = "HTTP"

    tags = {
      "Name" = "web_tier_tg"
    }
}