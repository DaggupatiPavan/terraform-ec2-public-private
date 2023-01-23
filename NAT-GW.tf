resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_nat_gateway" "natGW" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.PublicSubnet-1.id
  tags = {
    Name = "gw NAT"
  }
}