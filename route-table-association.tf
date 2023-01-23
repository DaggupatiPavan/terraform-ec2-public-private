resource "aws_route_table_association" "route-public" {
  subnet_id      = aws_subnet.PublicSubnet-1.id
  route_table_id = aws_route_table.public_router.id
}

resource "aws_route_table_association" "route-private" {
  subnet_id      = aws_subnet.PrivateSubnet-1.id
  route_table_id = aws_route_table.private_router.id
}

