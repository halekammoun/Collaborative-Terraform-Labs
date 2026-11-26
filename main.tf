terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "grp1profile"
}

resource "aws_vpc" "g1resource" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "CIM-B-VPC"
  }
}

resource "aws_subnet" "grp2" {
  vpc_id     = aws_vpc.g1resource.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "CIM-B-subnet"
  }
}

resource "aws_internet_gateway" "grp3" {
  vpc_id = aws_vpc.g1resource.id

  tags = {
    Name = "CIM-B-igw"
  }
}


resource "aws_route_table" "grp4" {
  vpc_id = aws_vpc.g1resource.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.grp3.id
  }

  tags = {
    Name = "CIM-B-route-table"
  }
}

resource "aws_route_table_association" "grp4" {
  subnet_id      = aws_subnet.grp2.id
  route_table_id = aws_route_table.grp4.id
}