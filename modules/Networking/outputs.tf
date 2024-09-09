output "vpc_id" {
  value = aws_vpc.tf-vpc.id
}

output "vpc_name" {
  value = var.vpc_name
  
}

output "igw_id" {
  value = aws_internet_gateway.tf-igw.id
}
output "public_rt_id" {
  value = aws_route_table.public-rt.id
}

output "private_rt_id" {
  value = aws_route_table.public-rt.id
}

output "nat_id" {
  value = aws_nat_gateway.my-nat.id
}
output "public_subnets_cidr_block" {
  value = var.public_subnets_cidr_block  
}

output "private_subnets_cidr_block" {
  value = var.private_subnets_cidr_block  
}

output "public_subnet_id" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnets[*].id  
}
