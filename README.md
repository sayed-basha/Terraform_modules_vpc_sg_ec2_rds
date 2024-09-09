This terraform modules will create VPC, Security group, EC2 and RDS DB.

Install terraform in your local and provide s3 bucket for backend.

To install terraform ref https://developer.hashicorp.com/terraform/install

#Terraform Basic commands

terraform init -> To initialize terraform

terraform validate -> validate the terraform code

terraform plan -> gives the blue print of resources, what resources will be going to create

terraform destroy -> will terminate or delete all resources which created by terraform
