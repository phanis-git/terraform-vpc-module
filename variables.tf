variable "vpc_cidr" {
  type = string
}
variable "project_name" {
  type = string
}
variable "environment" {
  type = string
}

variable "vpc_tags" {
  type = map 
  default = {}
}
variable "igw_tags" {
  type = map 
  default = {}
}

# subnet
variable "public_subnet_cidrs" {
  type = list
}
variable "private_subnet_cidrs" {
  type = list
}
variable "database_subnet_cidrs" {
    type = list
}

# subnet tags
variable "public_subnet_tags" {
  type = map 
  default = {}
}
variable "private_subnet_tags" {
   type = map 
  default = {}
}
variable "database_subnet_tags" {
   type = map 
  default = {}
}

# route table tags
variable "public_route_table_tags" {
   type = map 
  default = {}
}
variable "private_route_table_tags" {
   type = map 
  default = {}
}
variable "database_route_table_tags" {
   type = map 
  default = {}
}

# Elastic IP tags
variable "elastic_ip_tags" {
     type = map 
  default = {}
}

# NAT Gateway tags
variable "nat_gateway_tags" {
      type = map 
  default = {}
}

# Peering connection required or not
variable "is_peering" {
  type = bool
  default = true
}
variable "peering_connection_tags" {
      type = map 
  default = {}
}