resource "aws_eip" "my-eip" {
  tags = {
    Name = "my-eip"
  }

}

resource "aws_nat_gateway" "my-nat" {
  allocation_id = aws_eip.my-eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "${var.vpc_name}-nat"
  }
  depends_on = [ aws_internet_gateway.tf-igw ]

}