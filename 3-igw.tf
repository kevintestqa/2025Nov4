resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.satelite_environment.id

    tags = {
      "Name" = "main"
    }
}