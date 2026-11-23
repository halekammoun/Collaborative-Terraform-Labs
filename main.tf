
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
  vpc_id = aws_vpc.tes_vpc.id

  tags = {
    Name = "internet_gateway_C"
  }
}
