resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets_cidr_block)
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = element(var.public_subnets_cidr_block, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "${var.vpc_name}-public-subnets-${count.index+1}"
  }

}

resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets_cidr_block)
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = element(var.private_subnets_cidr_block, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "${var.vpc_name}-private-subnets-${count.index+1}"
  }

}