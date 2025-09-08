data "aws_ami" "sonarqube" {
  most_recent = true
  owners      = ["self"]
  filters = {
    name = "name"
    value = ["my-sonarqube-group2-*"]
  }
}
resource "aws_instance" "web" {
  ami                    = data.aws_ami.sonarqube.id #here packer will provide the AMI ID for the created image
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags                   = local.common_tags
}

