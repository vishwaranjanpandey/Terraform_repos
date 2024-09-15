variable "vpc_cidr" {
  type = string
  description = "devops project vpc"
}


variable "vpc_name" {
  type = string
  description = "DevOps Project 1 VPC 1"
}

variable "availability_zone" {
  type = list(string)
  description = "Availability Zones"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}


variable "ec2_ami_id" {
  type        = string
  description = "DevOps Project 1 AMI Id for EC2 instance"
}

variable "public_key" {
  type        = string
  description = "DevOps Project 1 Public key for EC2 instance"
}
