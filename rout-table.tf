resource "aws_route_table" "public_router" {
  vpc_id = aws_vpc.firstVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.firstIGW.id
  }
  tags = {
    Name = "public_router"
  }
}
resource "aws_route_table" "private_router" {
  vpc_id = aws_vpc.firstVPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGW.id
  }
  tags = {
    Name = "private_router"
  }
}



