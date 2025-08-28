variable "aws_region" {
  description = "Selects the aws region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
  default     = "ami-05fa00d4c63e32376"
}
variable "key_name" {
  description = "SSH key pair name for EC2"
  type        = string
  default     = ""
}