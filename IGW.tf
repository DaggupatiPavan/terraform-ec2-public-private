resource "aws_internet_gateway" "firstIGW" {
  vpc_id = aws_vpc.firstVPC.id

  tags = {
    Name = "firstIGW"
  }
}