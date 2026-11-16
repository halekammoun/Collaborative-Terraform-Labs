terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }
}

provider "aws" {
  profile = "terraform-lab"
  region = "us-east-1"
}


resource "aws_vpc" "my_vpc_D" {
  
  cidr_block = "10.0.0.0/16"

  tags = {
    Terraform = "true"
  }
}


