packer {
  required_plugins {
    amazon = {
      version = "1.2.8"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "group2" {
  region        = "us-east-1"
  instance_type = "t2.medium"
  ssh_username  = "ubuntu"
  ssh_interface = "public_ip"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"] # Canonical
  }

  ami_name        = "my-sonarqube-group2-{{ timestamp }}"
  ami_description = "Sonarqube AMI(Ubuntu 22.04) built by Packer and Ansible for group 2 project"
  ami_regions = [
    "us-east-1",
    # "us-east-2",
    # "us-west-1",
    # "us-west-2",
  ]
  temporary_key_pair_type = "rsa"
  temporary_key_pair_name = "packer-sonarqube-{{timestamp}}"

}

build {
  name = "sonarqube"
  sources = [
    "source.amazon-ebs.group2"
  ]

  provisioner "shell" {
    inline = [
      "sudo DEBIAN_FRONTEND=noninteractive apt-get update -y",
      "sudo apt-get install -y python3 unzip",
    ]
  }

  provisioner "ansible" {
    playbook_file = "../ansible/main.yml"
    use_proxy     = false
    user          = "ubuntu"
    extra_arguments = [
      "--become",
      "-e", "ansible_python_interpreter=/usr/bin/python3",
      "-e", "ansible_remote_tmp=/tmp",
      "-vvv"
    ]
  }
}