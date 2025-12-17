resource "aws_subnet" "public_1a" {
    vpc_id = aws_vpc.satelite_environment.id
    cidr_block = "10.45.1.0/24"
    availability_zone = "us-west-1a"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public-subnet-us-west-1a"
    }
}

resource "aws_subnet" "public_1c" {
    vpc_id = aws_vpc.satelite_environment.id
    cidr_block = "10.45.3.0/24"
    availability_zone = "us-west-1c"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "public-subnet-us-west-1c"
    }
}

############### Private #############
resource "aws_subnet" "private_1a" {
    vpc_id = aws_vpc.satelite_environment.id
    cidr_block = "10.45.11.0/24"
    availability_zone = "us-west-1a"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "private-subnet-us-west-1a"
    }
}

resource "aws_subnet" "private_1c" {
    vpc_id = aws_vpc.satelite_environment.id
    cidr_block = "10.45.13.0/24"
    availability_zone = "us-west-1c"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "private-subnet-us-west-1c"
    }
}