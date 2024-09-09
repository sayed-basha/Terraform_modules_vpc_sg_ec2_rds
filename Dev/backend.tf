terraform {
  backend "s3" {
    bucket = "bucket_name"
    region = "ap-south-1"
    key    = "terraform-modules/terraform.tfstate"

  }
}