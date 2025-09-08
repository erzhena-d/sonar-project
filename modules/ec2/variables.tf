variable "instance_type" {
  type = string
}

variable "region" {
  type        = string
  description = "AWS region to deploy resources in"
}
variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}
