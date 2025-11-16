resource "aws_security_group" "barret-lb" {
  name        = "barret-sg"
  description = "Allow HTTP for web tier ALB"
#   vpc_id      = aws_vpc.barret-vpc.id

  tags = {
    Name = "barret-lb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "barret-lb-http" {
  description = "HTTP Access"
  security_group_id = aws_security_group.barret-sg.id
  cidr_ipv4         = "0.0.0.0/0" ### anywhere ipV4 ######
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "HTTP"
  }
}

resource "aws_vpc_security_group_egress_rule" "barret-lb-egres" {
  security_group_id = aws_security_group.barret-lb.id
  description = "Allow all outbount traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}