variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}
variable "vpc_cidr" {
  type        = string
  description = "Provide vpc cidr block"
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  type        = string
  description = "Provide subnet1 cidr block"
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  type        = string
  description = "Provide subnet2 cidr block"
  default     = "10.0.2.0/24"
}

variable "subnet3_cidr" {
  type        = string
  description = "Provide subnet3 cidr block"
  default     = "10.0.3.0/24"
}

variable "ip_on_launch" {
  type    = bool
  default = true
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "key_name" {
  type        = string
  description = "Name of the key pair to use for EC2 instances"
  default     = "deployer-key"
}


