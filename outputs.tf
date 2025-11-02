output "vpc_id" {
    value = aws_vpc.main.id
}
output "aws_internet_gateway_id" {
  value = aws_internet_gateway.main.id
}
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}
output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
output "database_subnet_ids" {
  value = aws_subnet.database[*].id
}

output "elastic_ip" {
  value = aws_eip.nat.id
}
output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}