provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "Collaborative-Terraform-Labs"
      Lab       = "lab-1"
      Class     = "CIM-J-A"
      ManagedBy = "Terraform"
    }
  }
}
