data "aws_ami" "sonarqube" {
  most_recent = true
  owners      = ["self"]

# filter {
#     name = "name"
#     values = ["my-sonarqube-group2-*"]
#   }
}
resource "aws_instance" "web" {
  ami                    = data.aws_ami.sonarqube.id #here packer will provide the AMI ID for the created image
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  tags                   = local.common_tags
}

resource "aws_key_pair" "deployer" {
  key_name   = "ubuntu-key"
  public_key = file(var.ssh_public_key_path)
}
