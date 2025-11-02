locals {
  common_tags = {
    Project = var.project_name
    Environment = var.environment_name
    Terraform = true
  }
  common_name_suffix = "${var.project_name}-${var.environment_name}"    #roboshop-dev

  availability_zone = slice(data.aws_availability_zones.available.names,0,2)
}