### Terraform aws vpc
This module creates the following resources.

* VPC
* IGW
* 2 Public subnets in us-east-1a and us-east-1b AZ
* 2 Private subnets in us-east-1a and us-east-1b AZ
* 2 Database subnets in us-east-1a and us-east-1b AZ
* Public Route table
* Private Route table
* Database Route table
* EIP for NAT
* NAT Gateway in public subnet 1a az
* IGW route is added to public route table
* NAT gateway route to private and database route tables
* Route table association with subnets
* VPC to default VPC peering
* Public route table to default VPC route
* Default VPC main route table to created VPC route

### Inputs
* vpc_cidr - (Required). User must supply the CIDR for VPC.
* project_name - (Required). User must supply the project name.
* environment - (Required). User must supply the environment name.
* public_subnet_cidrs - (Required).
* private_subnet_cidrs - (Required).
* database_subnet_cidrs - (Required).
* is_peering_required - (Optional).
* tags - (Optional)

### Outputs 
* vpc_id
* aws_internet_gateway_id
* public_subnet_ids
* private_subnet_ids
* database_subnet_ids
* elastic_ip
* nat_gateway_id