# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

# output "az_zones" {
#   value = split(data.aws_availability_zones.available.names,0,2)
# }

data "aws_vpc" "default" {
  default = true
}

data "aws_route_table" "default" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}