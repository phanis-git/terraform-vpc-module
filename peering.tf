resource "aws_vpc_peering_connection" "default" {
  count = var.is_peering ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id  #target or acceptor vpc id
  vpc_id        = aws_vpc.main.id  # requester vpc id
  auto_accept   = true   #due to same account we put this
   accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
  tags =  merge(
        var.peering_connection_tags,
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-default"
        }
    ) 
}

# VPC routes  requester_to_accepter_route
# here i am giving public subnet us-east-1a
    # resource "aws_route" "requester_to_accepter_route" {
    resource "aws_route" "public_peering" {
      route_table_id            = aws_route_table.public.id    #public route table id
      destination_cidr_block    = data.aws_vpc.default.cidr_block
      vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id

    #   adding vpc routes is depends on vpc connection is required or not 
      # depends_on = [ aws_vpc_peering_connection.default ]
    #   we can use this also 
      count = var.is_peering ? 1 : 0       # it is list type so using count.index
    }

# VPC routes  accepter_to_requester_route
#     resource "aws_route" "accepter_to_requester_route" {
    resource "aws_route" "default_peering" {
      route_table_id            = data.aws_route_table.default.id  #default route table id
      destination_cidr_block    = var.vpc_cidr
      vpc_peering_connection_id = aws_vpc_peering_connection.default[count.index].id
        count = var.is_peering ? 1 : 0
      #  depends_on = [ aws_vpc_peering_connection.default ]
    }