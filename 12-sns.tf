resource "aws_sns_topic" "asg_scaling_events" {
  name = "scaling-events"
}

resource "aws_sns_topic_subscription" "asg_scaling_email" {
  topic_arn = aws_sns_topic.asg_scaling_events.arn
  protocol  = "email"
  endpoint  = "kevinwillocks@gmail.com"
}

resource "aws_autoscaling_notification" "web_asg_to_sns" {
  group_names = [
    aws_autoscaling_group.web_asg.name
  ]

//https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_NotificationConfiguration.html for more info on types of EC2 notifications
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.asg_scaling_events.arn
}