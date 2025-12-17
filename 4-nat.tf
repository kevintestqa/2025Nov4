resource "aws_eip" "nat" {
    domain = "vpc"

    tags = {
      Name = "nat-eip"
    }
}


resource "aws_nat_gateway" "main" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public_1a.id
    
    tags = {
      "Name" = "main"
    }
}