variable "region" {}
variable "vpc_name" {}
variable "subnet_ids" {}
variable "allocated_storage" {}
variable "db_name" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "username" {
    type = string
    sensitive = true
}
variable "password" {
    type = string
    sensitive = true
}
variable "parameter_group_name" {}
variable "skip_final_snapshot" {}
variable "publicly_accessible" {}
variable "backup_retention_period" {}
variable "multi_az" {}
variable "identifier" {}
variable "max_allocated_storage" {}
variable "vpc_security_group_ids" {}
variable "private_subnets_cidr_block" {}
