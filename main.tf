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
  region = "us-east-1"
  profile = "grp1profile"
}

resource "aws_vpc" "g1resource" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "CIM-B-VPC"
  }
}
