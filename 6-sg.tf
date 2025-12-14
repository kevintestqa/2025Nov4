resource "aws_security_group" "web_ec2" {
  name        = "web_ec2"
  description = "Allow inbound traffic and all outbound traffic to barretts bar"
  vpc_id      = aws_vpc.satelite_environment.id

  tags = {
    Name = "web_ec2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_http" {
  description = "HTTP Access"
  cidr_ipv4 = aws_vpc.satelite_environment.cidr_block
  security_group_id = aws_security_group.web_alb.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "web_ec2_ssh" {
  description = "SSH Access from internet"
  security_group_id = aws_security_group.web_alb.id
  cidr_ipv4 = aws_vpc.satelite_environment.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "SSH"
  }
}

resource "aws_vpc_security_group_egress_rule" "web_ec2-egress-allow-all-ipv4" {
  security_group_id = aws_security_group.web_ec2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
