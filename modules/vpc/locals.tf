locals {
  common_tags = {
    name        = "my-app"
    environment = var.region
    team        = 2
    project     = "sonarqube-app"
  }
}    