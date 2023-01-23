resource "aws_subnet" "PublicSubnet-1" {
  vpc_id            = aws_vpc.firstVPC.id
  cidr_block        = var.Public_subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "PublicSubnet-1"
  }
}

resource "aws_subnet" "PrivateSubnet-1" {
  vpc_id            = aws_vpc.firstVPC.id
  cidr_block        = var.Private_subnet_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "PrivateSubnet-1"
  }
}