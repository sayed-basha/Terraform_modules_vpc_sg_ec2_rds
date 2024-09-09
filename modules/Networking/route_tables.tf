resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.tf-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-RT"
  }
}

resource "aws_route_table_association" "public-RT" {
  count          = length(var.public_subnets_cidr_block)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.tf-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my-nat.id
  }

  tags = {
    Name = "${var.vpc_name}-private-RT"
  }
}

resource "aws_route_table_association" "private-RT" {
  count          = length(var.private_subnets_cidr_block)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}