resource "aws_launch_template" "web_ec2" {
    description = "Launch template for web tier servers"
    name = "web-tier-server-template"
    image_id = "ami-03ff9720b16e8da76"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.web_ec2.id ]

    tags = {
      "name" = "web-tier-server template"
    }

    user_data = filebase64("user_data.sh")

    lifecycle {
      create_before_destroy = true
    }

}