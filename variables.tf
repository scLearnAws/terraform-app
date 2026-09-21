variable "aws_region" {
  description = "AWS region containing the terraform-core foundation."
  type        = string
  default     = "eu-central-1"
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "VPC ID created by terraform-core."
  type        = string
  default     = "vpc-0554dd1cc30fbf846"
}

variable "subnet_id" {
  description = "Public subnet ID created by terraform-core."
  type        = string
  default     = "subnet-022d3c7e36a8dbf8e"
}

variable "instance_profile_name" {
  description = "Existing SSM instance profile created by terraform-core."
  type        = string
  default     = "dev-ec2-ssm-instance-profile"
}

variable "ami_id" {
  description = "Pinned AMI ID for the application instance."
  type        = string
  default     = "ami-05f538da85d563285"
}
