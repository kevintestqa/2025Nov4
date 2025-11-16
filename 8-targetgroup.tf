resource "aws_lb_target_group" "barret-lb-target-group" {
    name = "web-tier-server-target-group"
    port = 80
    vpc_id = aws_vpc.barret-vpc.id
    protocol = "HTTP"

    tags = {
      "Name" = "web-tier-tg"
    }
}