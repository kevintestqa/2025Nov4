resource "aws_autoscaling_attachment" "web_asg_to_alb" {
    autoscaling_group_name = aws_autoscaling_group.web_asg.id
    lb_target_group_arn = aws_lb_target_group.web_alb_tg.arn
}