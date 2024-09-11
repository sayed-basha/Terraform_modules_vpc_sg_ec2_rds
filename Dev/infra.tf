module "dev_infra_vpc" {
  source                     = "../modules/Networking"
  region                     = "ap-south-1"
  vpc_cidr_block             = "10.10.0.0/16"
  vpc_name                   = "custome-module"
  public_subnets_cidr_block  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  private_subnets_cidr_block = ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
  availability_zone          = ["ap-south-1a", "ap-south-1b", ]

}

module "dev_infra_sg" {
  source   = "../modules/SG"
  vpc_id   = module.dev_infra_vpc.vpc_id
  region   = "ap-south-1"
  vpc_name = module.dev_infra_vpc.vpc_name

}

module "dev_infra_ec2" {
  source                     = "../modules/EC2"
  public_subnets_cidr_block  = module.dev_infra_vpc.public_subnets_cidr_block
  private_subnets_cidr_block = module.dev_infra_vpc.private_subnets_cidr_block
  ami                        = "ami-0f58b397bc5c1f2e8"
  public_subnet_id           = module.dev_infra_vpc.public_subnet_id
  private_subnet_id          = module.dev_infra_vpc.private_subnet_id
  instance_type              = "t2.micro"
  vpc_security_group_ids     = module.dev_infra_sg.sg_id
  vpc_name                   = module.dev_infra_vpc.vpc_name
  region                     = "ap-south-1"
  key_name                   = "hyd"
}

module "dev_infra_rds" {
  source                  = "../modules/RDS"
  region                  = "ap-south-1"
  vpc_name                = module.dev_infra_vpc.vpc_name
  subnet_ids              = module.dev_infra_vpc.private_subnet_id
  allocated_storage       = "20"
  db_name                 = "myrds"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "${file("D:/rdspasswd/rds_passwd.txt")}"
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  publicly_accessible     = true
  backup_retention_period = 7
  multi_az                = true
  identifier              = "my_rds"
  max_allocated_storage   = "20"
  vpc_security_group_ids  = module.dev_infra_sg.sg_id
  private_subnets_cidr_block = module.dev_infra_vpc.private_subnets_cidr_block


}

