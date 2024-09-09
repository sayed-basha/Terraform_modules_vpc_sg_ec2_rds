resource "aws_instance" "public-vm" {
    count = length(var.public_subnets_cidr_block)
    ami = var.ami
    subnet_id = element(var.public_subnet_id, count.index)
    instance_type = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids = [var.vpc_security_group_ids]
    key_name = var.key_name

    tags = {
      Name = "${var.vpc_name}-public-vm-${count.index+1}"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                sudo apt install mysql-server -y
                sudo rm -rf /var/www/html/*
                sudo touch /var/www/html/index.html
                echo "Hello World from $(hostname -i)" >> /var/www/html/index.html
                sudo systemctl start --now nginx
            EOF
  
}


resource "aws_instance" "private-vm" {
    count = length(var.private_subnets_cidr_block)
    ami = var.ami
    subnet_id = element(var.private_subnet_id, count.index)
    instance_type = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids = [var.vpc_security_group_ids]
    key_name = var.key_name

    tags = {
      Name = "${var.vpc_name}-private-vm-${count.index+1}"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                sudo rm -rf /var/www/html/*
                sudo touch /var/www/html/index.html
                echo "Hello World from $(hostname -i)" >> /var/www/html/index.html
                sudo systemctl start --now nginx
            EOF
  
}