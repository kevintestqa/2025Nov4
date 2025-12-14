resource "aws_autoscaling_policy" "web_cpu_target_tracking" {
    name = "web-tier-cpu"
    autoscaling_group_name = aws_autoscaling_group.web_asg.name
    estimated_instance_warmup = 60
    policy_type = "TargetTrackingScaling"

    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }

      target_value = 40.0
    }


}