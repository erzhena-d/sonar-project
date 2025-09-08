
provider "aws" {
    region = var.region
}
terraform {
  backend "s3" {
    bucket = "sonar-bucket-erzhena"
    key    = "terraform.tfstate"
    region = "${var.region}"
  }
}

module vpc {
    source = "../modules/vpc"
    vpc_cidr = var.vpc_cidr
    subnet1_cidr = var.subnet1_cidr
    subnet2_cidr = var.subnet2_cidr
    subnet3_cidr = var.subnet3_cidr
    ip_on_launch = var.ip_on_launch
    region = var.region
}

module ec2 {
    source = "../modules/ec2"
    instance_type = var.instance_type
    region = var.region
    # subnet_id = module.vpc.subnet
    # security_group_id = module.vpc.security_group_id
}

