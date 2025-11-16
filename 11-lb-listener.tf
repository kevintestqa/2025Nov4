resource "aws_lb_listener" "barret-listner" {
    load_balancer_arn = aws_lb.barret-lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.barret-lb-target-group.arn
    }
    
}