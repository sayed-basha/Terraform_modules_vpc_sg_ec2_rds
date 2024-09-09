output "rds_db_subnet_id" {
    value = aws_db_subnet_group.rds_db_subnet.*.id
  
}

output "aws_db_instance_id" {
    value = aws_db_instance.aws_db_instance.id
}