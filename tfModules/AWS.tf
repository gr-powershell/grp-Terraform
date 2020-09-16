# Terraform AWS Module.

# Using Terraform Providers, declare the AWS provider:
provider "aws" {
  version                 = "~> 3.0"
  region                  = var.aws_region
  shared_credentials_file = "C:/Users/gpowers/.aws/credentials"
}

# Using Terraform Resources, set up an AWS S3 bucket:
resource "aws_s3_bucket" "b" {
  bucket        = "grp-tf-test-bucket"
  acl           = "private"
  force_destroy = var.s3_destroy
}

# Using Terraform Resources, set up an AWS EC2 instance:
resource "aws_instance" "grp-ec2" {
  ami           = "ami-0eb7fbcc77e5e6ec6"
  instance_type = var.ec2_instance_type
}
