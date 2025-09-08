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

variable "key_name" {
  type        = string
  description = "Name of the key pair to use for EC2 instances"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/deployer-key.pub"
}