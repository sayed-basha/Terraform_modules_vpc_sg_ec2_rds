provider "aws" {
    region = var.region
}

resource "aws_db_subnet_group" "rds_db_subnet" {
    name       = "rds_db_subnet"
    subnet_ids = var.subnet_ids

    tags = {
      Name = "${var.vpc_name}-rds_db_subnet-"
    }
  
}

resource "aws_db_instance" "aws_db_instance" {
    allocated_storage = var.allocated_storage
    db_name = var.db_name
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    username = var.username
    password = var.password
    parameter_group_name = var.parameter_group_name
    skip_final_snapshot = var.skip_final_snapshot
    publicly_accessible = var.publicly_accessible
    backup_retention_period = var.backup_retention_period
    multi_az = var.multi_az
    db_subnet_group_name = aws_db_subnet_group.rds_db_subnet.name
    identifier = var.identifier
    max_allocated_storage = var.max_allocated_storage
    vpc_security_group_ids = [var.vpc_security_group_ids]
    
    tags = {
      Name = "${var.vpc_name}-my-rds-instance"
    }
  
}



