resource "aws_route_table" "public" {
    vpc_id = aws_vpc.satelite_environment.id
    
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main.id
    }

    tags = {
      "Name" = "public"
    }

    depends_on = [ aws_internet_gateway.main]
}

resource "aws_route_table_association" "public-1a" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public-us-west-1a.id
}

resource "aws_route_table_association" "public-1c" {
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public-us-west-1c.id
}

########## Private Route Table REMEMBER TO ADD A RPIVATE ROUTE TABLE FIRST ############

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.satelite_environment.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        Name = "private"
    }
    
}

resource "aws_route_table_association" "private_1a" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private_1a.id
}

resource "aws_route_table_association" "private_1c" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.private_1c.id
}