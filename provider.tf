terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.72.0" //5.31.0
    }
  }
}

provider "aws" {
  profile = "terraform-lab"
  region  = "us-east-1"
}
