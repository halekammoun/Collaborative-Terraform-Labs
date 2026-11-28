# ============================================================
# Variables partagées — tous les groupes
# ============================================================

variable "aws_region" {
  description = "Région AWS (AWS Academy Learner Lab : us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Préfixe utilisé dans le tag Name de chaque ressource"
  type        = string
  default     = "cim-j-a"
}

# --- G1 : VPC ---
variable "vpc_cidr" {
  description = "Bloc CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# --- G2 : Public Subnet ---
variable "public_subnet_cidr" {
  description = "Bloc CIDR du subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Zone de disponibilité du subnet public"
  type        = string
  default     = "us-east-1a"
}

# --- G6 : EC2 ---
variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nom de la key pair SSH (Learner Lab : vockey)"
  type        = string
  default     = "vockey"
}
