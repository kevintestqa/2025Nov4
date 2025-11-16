resource "aws_autoscaling_attachment" "barret-web_tier-attachment" {
    autoscaling_group_name = aws_autoscaling_group.barret-asg.id
    lb_target_group_arn = aws_lb_target_group.barret-lb-target-group.arn
}