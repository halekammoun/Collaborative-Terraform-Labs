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

resource "aws_security_group" "grp5" {
  name        = "CIM-B-sg"
  description = "Allow HTTP and SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.g1resource.id

  tags = {
    Name = "CIM-B-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.grp5.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "CIM-B-allow-http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.grp5.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "CIM-B-allow-ssh"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.grp5.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 

  tags = {
    Name = "CIM-B-allow-all-egress"
  }
}