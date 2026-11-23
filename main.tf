
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "VPC-C"
  }
}

resource "aws_subnet" "test_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    name = "subnet-C"
  }
}

resource "aws_internet_gateway" "test_gw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "internet_gateway_C"
  }
}

resource "aws_route_table" "test_route_table" {
  vpc_id = aws_vpc.test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_gw.id
  }

  tags = {
    Name = "route_table_C"
  }
}

resource "aws_route_table_association" "test_asso_rt" {
  subnet_id      = aws_subnet.test_subnet.id
  route_table_id = aws_route_table.test_route_table.id
}


