data "aws_ami" "sonarqube" {
  most_recent = true
  owners = ["self"] 
}  

resource "aws_instance" "web" {
  ami                    = data.aws_ami.sonarqube.id #here packer will provide the AMI ID for the created image
  # key_name               = "ubuntu-key"
  instance_type          = var.instance_type
  # subnet_id              = var.subnet_id
  # vpc_security_group_ids = [var.security_group_id]
}

data terraform_remote_state "vpc" {
  backend = "s3"
  config = {
    bucket = "sonar-bucket-erzhena"
    key    = "../vpc/terraform.tfstate"
    region = var.region
  }
}
